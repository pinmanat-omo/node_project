var express = require('express')
var ejs = require('ejs');
var bodyParser = require('body-parser');
var mysql = require('mysql');
var session = require('express-session')

var app = express();

app.use(express.static('public'));
app.set('view engine','ejs');

app.listen(3000);
app.use(bodyParser.urlencoded({extended:true}));
app.use(session({secret:"secret"}))



function isProductInCart(cart, id) {
    for (let i = 0; i < cart.length; i++) {
        if (cart[i].id == id) {
            return true;
        }
    }

    return false;

}



function calculateTotal(cart, req) {
    total = 0;
    for (let i = 0; i < cart.length; i++) {
        if (cart[i].sale_price) {
            total = total + (cart[i].sale_price * cart[i].quantity);
        } else {
            total = total + (cart[i].price * cart[i].quantity)
        }
    }
    req.session.total = total;
    return total;

}

app.get('/', (req, res) => {

    var con = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'node_project',
    })

    con.query('SELECT * FROM products', (error, results) =>{
        res.render('pages/index.ejs', { products: results });
    })




});


app.post('/add_to_cart', function (req, res) {


    var id = req.body.id;
    var name = req.body.name;
    var price = req.body.price;
    var sale_price = req.body.sale_price;
    var quantity = req.body.quantity;
    var image = req.body.image;
    var product = { id: id, name: name, price: price, sale_price: sale_price, quantity: quantity, image: image };

    if (req.session.cart) {
        var cart = req.session.cart;

        if (!isProductInCart(cart,id)){
            cart.push(product);
        }
    } else {

        req.session.cart = [product];
        var cart = req.session.cart;

    }

    //calculate total
    calculateTotal(cart, req);

    //return to cart page
    res.redirect('/cart');


});

app.get('/cart', function (req, res) {
    var cart = req.session.cart;
    var total = req.session.total;

    res.render('pages/cart', { cart:cart,total:total,});
});

app.post('/remove_product',function(req,res){

    var id = req.body.id;
    var cart = req.session.cart;

    for(let i=0; i<cart.length; i++){
        if(cart[i].id == id){
            cart.splice(cart.indexOf(i),1);
        }
    }

    //re-calculate
    calculateTotal(cart,req);
    res.redirect('/cart');

});

app.post('/edit_product_quantity',function(req,res){

    //get values from inputs
    var id = req.body.id;
    var quantity = req.body.quantity;
    var increase_btn = req.body.increase_product_quantity;
    var decrease_btn = req.body.decrease_product_quantity;

    var cart = req.session.cart;

    if(increase_btn){
        for(let i=0; i<cart.length; i++){
            if(cart[i].id == id){
                if(cart[i].quantity > 0){
                    cart[i].quantity = parseInt(cart[i].quantity)+1;
                }
            }
        }
    }

    if(decrease_btn){
        for(let i=0; i<cart.length; i++){
            if(cart[i].id == id){
                if(cart[i].quantity > 1){
                    cart[i].quantity = parseInt(cart[i].quantity)-1;
                }
            }
        }
    }

    calculateTotal(cart,req);
    res.redirect('/cart')

});

app.get("/checkout",function(req, res){
    var cart = req.session.cart;
    var total = req.session.total
    res.render('pages/checkout',{total:total,cart:cart})
})


app.post('/place_order',function(req,res){

    var name = req.body.name;
    var email = req.body.email;
    var phone = req.body.phone;
    var city = req.body.city;
    var address = req.body.address;
    var cost = req.session.total;
    var status = "not paid";
    var date = new Date();
    var products_ids = "";

    var con = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'node_project',
    });

    var cart = req.session.cart;
    for(let i=0; i<cart.length; i++){
        products_ids = products_ids + "," +cart[i].id;
    }

    con.connect((err)=>{
        if(err){
            console.log(err)
        } else {
            var query = "INSERT INTO orders(cost,name,email,status,city,address,phone,date,products_ids) VALUES ?";
            var values = [
            [cost,name,email,status,address,phone,date,city,products_ids]
            ];
            con.query(query,[values],(err,result)=>{

                res.redirect('/order-complete')
            })
        }
    })

})

app.get("/order-complete", (req, res) => {
    res.render("pages/order-complete",{page:"order-complete"});

})

app.get("/women", (req, res) => {
    res.render("pages/women",{page:"women"});

})

app.get("/men", (req, res) => {
    res.render("pages/men",{page:"men"});

})

app.get("/contact", (req, res) => {
    res.render("pages/contact",{page:"contact"});

})

    //npm init -y
    //npm i express --save
    //npm i ejs
    //npm i mysql
    //npm i body-parser 
    //npm i express-session