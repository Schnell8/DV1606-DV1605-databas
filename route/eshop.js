/**
 * General routes.
 */
"use strict";

const express    = require("express");
const router     = express.Router();
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const eshop      = require("../src/eshop.js");

router.get("/index", (req, res) => {
    let data = {
        title: "Eshop | Index"
    };

    res.render("index", data);
});

router.get("/about", (req, res) => {
    let data = {
        title: "Eshop | About"
    };

    res.render("about", data);
});

router.get("/category", async (req, res) => {
    let data = {
        title: "Eshop | Category"
    };

    data.res = await eshop.showCategories();

    res.render("category", data);
});

router.get("/product", async (req, res) => {
    let data = {
        title: "Eshop | Product"
    };

    data.res = await eshop.showProducts();

    res.render("product", data);
});

router.get("/product/:produktkod", async (req, res) => {
    let produktkod = req.params.produktkod;
    let data = {
        title: `Eshop | Product ${produktkod}`,
        produkt: produktkod
    };

    data.res = await eshop.showSingleProduct(produktkod);

    res.render("product-view", data);
});

router.get("/create", (req, res) => {
    let data = {
        title: "Eshop | Create"
    };

    res.render("create", data);
});

router.post("/create", urlencodedParser, async (req, res) => {
    await eshop.createProduct(req.body.produktkod, req.body.namn, req.body.beskrivning,
        req.body.pris, req.body.antal, req.body.kategori);
    res.redirect("/eshop/create");
});

router.get("/product/delete/:produktkod", async (req, res) => {
    let produktkod = req.params.produktkod;
    let data = {
        title: `Eshop | Delete ${produktkod}`,
        produkt: produktkod
    };

    data.res = await eshop.showSingleProduct(produktkod);

    res.render("product-delete", data);
});

router.post("/product/delete", urlencodedParser, async (req, res) => {
    await eshop.deleteProduct(req.body.produktkod);
    res.redirect(`/eshop/product`);
});

router.get("/product/edit/:produktkod", async (req, res) => {
    let produktkod = req.params.produktkod;
    let data = {
        title: `Eshop | Edit ${produktkod}`,
        produkt: produktkod
    };

    data.res = await eshop.showSingleProduct(produktkod);

    res.render("product-edit", data);
});

router.post("/product/edit", urlencodedParser, async (req, res) => {
    await eshop.editProduct(req.body.produktkod, req.body.namn,
        req.body.beskrivning, req.body.pris);
    res.redirect(`/eshop/product/edit/${req.body.produktkod}`);
});

router.get("/customer", async (req, res) => {
    let data = {
        title: "Eshop | Customer"
    };

    data.res = await eshop.showCustomers();

    res.render("customer", data);
});

router.get("/order", async (req, res) => {
    let data = {
        title: "Eshop | Order"
    };

    data.res = await eshop.showOrders();

    res.render("order", data);
});

router.get("/order/create/:kundnummer", async (req, res) => {
    let kundnummer = req.params.kundnummer;
    let data = {
        title: `Eshop | Skapa order för ${kundnummer}`,
        kund: kundnummer
    };

    data.res = await eshop.showSingleCustomer(kundnummer);

    res.render("order-create", data);
});

router.post("/order/create", urlencodedParser, async (req, res) => {
    await eshop.createOrder(req.body.kundnummer);
    res.redirect(`/eshop/order`);
});

router.get("/order/add-products/:ordernummer", async (req, res) => {
    let ordernummer = req.params.ordernummer;
    let data = {
        title: `Eshop | Lägg till produkter för ${ordernummer}`,
        ordernummer: ordernummer
    };

    data.res = await eshop.orderAddPage(ordernummer);

    res.render("order-add-product", data);
});

router.post("/order/add-product", urlencodedParser, async (req, res) => {
    await eshop.addToOrder(req.body.ordernummer, req.body.produktkod, req.body.antal);
    res.redirect(`/eshop/order`);
});

router.get("/order/view/:ordernummer", async (req, res) => {
    let ordernummer = req.params.ordernummer;
    let data = {
        title: `Eshop | Detaljer för order "${ordernummer}"`,
        ordernummer: ordernummer

    };

    data.res = await eshop.showSingleOrder(ordernummer);

    res.render("order-details", data);
});

router.post("/order/bestall", urlencodedParser, async (req, res) => {
    await eshop.bestallOrder(req.body.ordernummer);
    res.redirect(`/eshop/order`);
});

module.exports = router;
