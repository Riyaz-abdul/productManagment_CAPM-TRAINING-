import cds from '@sap/cds'







export class orderMgnt extends cds.ApplicationService { init() {

  const { Orders, OrderItems, Products } = cds.entities('orderMgnt')

  // this.before (['CREATE', 'UPDATE'], Orders, async (req) => {
  //   console.log('Before CREATE/UPDATE Orders', req.data)
  // })

this.after("PATCH", "OrderItems.drafts", async (result, req) => {

    const ID = req.data.ID;
    console.log(req)

    const draftItem = await SELECT.one
        .from(OrderItems.drafts)
        .where({ ID });

    let totalPrice = calculateItemTotalPrice(draftItem);

    await UPDATE(OrderItems.drafts)
        .set({ totalPrice })
        .where({ ID });

    let Allitems =   await SELECT.from(OrderItems.drafts).where({order_ID:req.data.order_ID})

    let netPrice = calculateNetPrice(Allitems)
    await UPDATE(Orders.drafts).set({netPrice:netPrice}).where({ID:req.data.order_ID})
  

});
this.after("DELETE",OrderItems.drafts,async(result, req)=>{
      const allDraftItems = await SELECT.from(OrderItems.drafts).where({ order_ID: req.data.order_ID });
       let netPrice = calculateNetPrice(allDraftItems);
      await UPDATE(Orders.drafts).set({ netPrice: netPrice }).where({ ID:req.data.order_ID  });
    });


this.before(['CREATE','UPDATE'],Orders,async (req)=>{

    let items= req.data.items;
    console.log("------------")
    console.log(items)
     let pid = items[0].product_ID;
     console.log("-------",pid)
   
  
   
    for(let item of items){
        console.log("*****",item)
      let pid = item.product_ID;
      console.log(pid)
      let product = await SELECT.one.from(Products).where({ID:pid})
      console.log("product",product)
      let qty = item.quantity
      console.log("***",product.stock)
        if(qty > product.stock){
            req.reject('currently stock is unavailable + "   " + will be notified through mail');
        }

    }


})

this.after(['CREATE','UPDATE'],Orders,async(result,req)=>{
   console.log("????????????",req.data)
   let items =  req.data.items

    for(let item of items){
        await UPDATE(Products).set({stock : {'-=':item.quantity}}).where({ID:item.product_ID})
    }
})

function calculateItemTotalPrice(draftItem) {

    if (draftItem) {

        let totalPrice =
            (draftItem.quantity || 0) *
            (draftItem.unitPrice || 0);

        if (draftItem.discount > 0) {

            totalPrice =
                totalPrice -
                (totalPrice * draftItem.discount / 100);
        }

        return totalPrice;
    }

    return 0;
}
function calculateNetPrice(items){
  let netPrice = 0;
  for(let i = 0 ;i<items.length;i++){
    netPrice = netPrice + Number(items[i].totalPrice);
  }

  return netPrice;
}

  return super.init()
}}
