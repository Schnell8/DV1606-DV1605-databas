"use strict";

// Read from commandline
const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const eshop = require("./src/eshop.js");

function exitProgram(code=0) {
    console.log(`
        Program exits with status: ${code}
    `);
    process.exit(code);
}

function showMenu() {
    console.log(`
        Choose something from the menu:

        exit                                Exit program
        menu                                Show this menu
        about                               Name of the person responsible for this program
        log <number>                        Show <number> latest rows from table 'logg'
        product                             Show all products
        shelf                               Show shelfs in inventory
        inv                                 Show location of products in inventory
        inv <str>                           Use <str> to help you filter the inventory
        invadd <productid> <shelf> <number> Add to inventory
        invdel <productid> <shelf> <number> Delete from inventory
        order <search>                      Search for order, filter with <search>
        picklist <orderid>                  Picklist for order <orderid>
        ship <orderid>                      Change status for order <orderid>
    `);
}

function showAbout() {
    console.log(`
        Christopher Schnell
    `);
}

/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function() {
    rl.setPrompt("Enter input: ");
    rl.prompt();
    rl.on("close", exitProgram);

    rl.on("line", async (input) => {
        input = input.trim();
        let parts = input.split(" ");

        switch (parts[0]) {
            case "exit": {
                exitProgram();
                break;
            }
            case "menu": {
                showMenu();
                break;
            }
            case "about": {
                showAbout();
                break;
            }
            case "log": {
                let log = await eshop.showLog(parts[1]);

                console.table(log);
                break;
            }
            case "product": {
                let products = await eshop.showProducts();

                console.table(products);
                break;
            }
            case "shelf": {
                let shelfs = await eshop.showShelfs();

                console.table(shelfs);
                break;
            }
            case "inv": {
                if (input === "inv") {
                    let inv = await eshop.showInv();

                    console.table(inv);
                    break;
                } else {
                    let searchInv = await eshop.searchInv(parts[1]);

                    console.table(searchInv);
                    break;
                }
            }
            case "invadd": {
                await eshop.invAdd(parts[1], parts[2], parts[3]);

                console.log(`
        Mission accomplished
                `);
                break;
            }
            case "invdel": {
                await eshop.invDel(parts[1], parts[2], parts[3]);

                console.log(`
        Mission accomplished
                `);
                break;
            }
            case "order": {
                if (input === "order") {
                    let order = await eshop.showOrders();

                    console.table(order);
                    break;
                } else {
                    let searchOrder = await eshop.searchOrder(parts[1]);

                    console.table(searchOrder);
                    break;
                }
            }
            case "picklist": {
                let picklist = await eshop.pickList(parts[1]);

                console.table(picklist);
                break;
            }
            case "ship": {
                await eshop.shipOrder(parts[1]);

                console.log(`
        Mission accomplished
                `);
                break;
            }
            default: {
                showMenu();
                break;
            }
        }

        rl.prompt();
    });
})();
