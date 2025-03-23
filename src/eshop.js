/**
 * A module exporting functions to access the bank database.
 */
"use strict";

const mysql  = require("promise-mysql");
const config = require("../config/db/eshop.json");
let db;

/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

// ESHOP DEL 1
async function showCategories() {
    let sql = `CALL show_categories();`;
    let res;

    res = await db.query(sql);

    return res[0];
}

async function showProducts() {
    let sql = `CALL show_products();`;
    let res;

    res = await db.query(sql);

    return res[0];
}

async function createProduct(produktkod, namn, beskrivning, pris, antal, kategori) {
    let sql = `CALL create_product(?, ?, ?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [produktkod, namn, beskrivning, pris, antal, kategori]);

    return res[0];
}

async function showSingleProduct(produktkod) {
    let sql = `CALL show_single_product(?);`;
    let res;

    res = await db.query(sql, [produktkod]);

    return res[0];
}

async function deleteProduct(produktkod) {
    let sql = `CALL delete_product(?);`;
    let res;

    res = await db.query(sql, [produktkod]);

    return res[0];
}

async function editProduct(produktkod, namn, beskrivning, pris) {
    let sql = `CALL edit_product(?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [produktkod, namn, beskrivning, pris]);

    return res[0];
}

async function showLog(number) {
    let sql = `CALL show_log(?);`;
    let res;

    res = await db.query(sql, [number]);

    return res[0];
}

async function showShelfs() {
    let sql = `CALL show_shelfs();`;
    let res;

    res = await db.query(sql);

    return res[0];
}

async function showInv() {
    let sql = `CALL show_inv();`;
    let res;

    res = await db.query(sql);

    return res[0];
}

async function searchInv(str) {
    let sql = `CALL search_inv(?);`;
    let res;

    res = await db.query(sql, [str]);

    return res[0];
}

async function invAdd(produktkod, hylla, antal) {
    let sql = `CALL inv_add(?, ?, ?);`;
    let res;

    res = await db.query(sql, [produktkod, hylla, antal]);

    return res[0];
}

async function invDel(produktkod, hylla, antal) {
    let sql = `CALL inv_del(?, ?, ?);`;
    let res;

    res = await db.query(sql, [produktkod, hylla, antal]);

    return res[0];
}

// ESHOP DEL 2
async function showCustomers() {
    let sql = `CALL show_customers();`;
    let res;

    res = await db.query(sql);

    return res[0];
}

async function showSingleCustomer(kundnummer) {
    let sql = `CALL show_single_customer(?);`;
    let res;

    res = await db.query(sql, [kundnummer]);

    return res[0];
}

async function showOrders() {
    let sql = `CALL show_orders();`;
    let res;

    res = await db.query(sql);

    return res[0];
}

async function showSingleOrder(ordernummer) {
    let sql = `CALL show_single_order(?);`;
    let res;

    res = await db.query(sql, [ordernummer]);

    return res[0];
}

async function createOrder(kundnummer) {
    let sql = `CALL create_order(?);`;
    let res;

    res = await db.query(sql, [kundnummer]);

    return res[0];
}

async function addToOrder(orderId, produktId, antal) {
    let sql = `CALL add_to_order(?, ?, ?);`;
    let res;

    res = await db.query(sql, [orderId, produktId, antal]);

    return res[0];
}

async function bestallOrder(ordernummer) {
    let sql = `CALL bestall_order(?);`;
    let res;

    res = await db.query(sql, [ordernummer]);

    return res[0];
}

async function orderAddPage(ordernummer) {
    let sql = `CALL order_add_page(?);`;
    let res;

    res = await db.query(sql, [ordernummer]);

    return res[0];
}

async function searchOrder(input) {
    let sql = `CALL search_order(?);`;
    let res;

    res = await db.query(sql, [input]);

    return res[0];
}

async function pickList(ordernummer) {
    let sql = `CALL pick_list(?);`;
    let res;

    res = await db.query(sql, [ordernummer]);

    return res[0];
}

async function shipOrder(ordernummer) {
    let sql = `CALL ship_order(?);`;
    let res;

    res = await db.query(sql, [ordernummer]);

    return res[0];
}

module.exports = {
    showCategories: showCategories,
    showProducts: showProducts,
    createProduct: createProduct,
    showSingleProduct: showSingleProduct,
    deleteProduct: deleteProduct,
    editProduct: editProduct,
    showLog: showLog,
    showShelfs: showShelfs,
    showInv: showInv,
    searchInv: searchInv,
    invAdd: invAdd,
    invDel: invDel,
    showCustomers: showCustomers,
    showSingleCustomer: showSingleCustomer,
    showOrders: showOrders,
    showSingleOrder: showSingleOrder,
    createOrder: createOrder,
    addToOrder: addToOrder,
    bestallOrder: bestallOrder,
    orderAddPage: orderAddPage,
    searchOrder: searchOrder,
    pickList: pickList,
    shipOrder: shipOrder
};
