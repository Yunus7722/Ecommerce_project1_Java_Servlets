
function myFunction() {
    var x = document.getElementById("myInput");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}


// add_to_cart is a function used to add the nummber of products or increase for cart option
//these function is from client side method where we write javascript code to create cart
// in these method if u r deleting cache manually in chromme than data will go
// there is another method known as server side in which database is involved
function add_to_cart(pId, pName, pQuantity, pPrice)
{

    let cart = localStorage.getItem("cart");

    if (cart == null) {
        //cart is not there

        //writing the logic to add the product to the cart
        let product_s = [];
        let product = {productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice};
        product_s.push(product);
        localStorage.setItem("cart", JSON.stringify(product_s));
        console.log("Product added for the First Time");


    } else {
        //cart is already present

        let pCart = JSON.parse(cart);       // parse will convert that string to array
        let oldProduct = pCart.find((item) => item.productId == pId);
        console.log(oldProduct);
        if (oldProduct) {
            // we have to increase the quantity beacause the product is already present 
            if (oldProduct.productQuantity < pQuantity)
            {
                oldProduct.productQuantity = oldProduct.productQuantity + 1;
                pCart.map((item) => {
                    if (item.productId === oldProduct.productId)
                    {
                        item.productQuantity = oldProduct.productQuantity;
                    }
                });
                localStorage.setItem("cart", JSON.stringify(pCart));
                console.log("product Quantity is increased");
            } else {
                console.log("Sorry Quantity is not available");
            }
        } else {

            // we have to add the product here because that if loop will run only for first try
            let product = {productId: pId, productName: pName, productQuantity: 1, productPrice: pPrice};
            pCart.push(product);
            localStorage.setItem("cart", JSON.stringify(pCart));
            console.log("product added for the Second Time");
        }

    }




}