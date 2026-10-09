import cds from '@sap/cds'




export class ProductMgmt extends cds.ApplicationService { init() {

  const { Products, Orders, OrderItems } = cds.entities('ProductMgmt')
  this.on('AddStock',async (req)=>{
    let Pid = req.params[0].ID;
    let product = await SELECT.one.from(Products).where({ID:Pid})
  
    await UPDATE(Products).set({stock : {'+=':req.data.stock}}).where({ID:Pid})
   req.info("stock added successfuly")

  })

  this.on('AddDiscount',async(req)=>{
   let pid = req.params[0].ID;
   await UPDATE(Products).set({discount : req.data.dis})
   req.info('discount added')
  })



  return super.init()
}}
