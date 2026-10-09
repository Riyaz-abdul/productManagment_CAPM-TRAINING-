using {com.productmgmt as db} from '../db/schema';

service orderMgnt {


    @odata.draft.enabled
    @Common.SideEffects:{
        SourceEntities:['items'],
        TargetProperties:['netPrice']
    }
    @restrict :[
        {
            grant : '*',
            to :'owner'
        },
        {
            grant : ['WRITE','READ'],
            to : 'employee', where: (strorName    =  $user.strorName)
          
        }
    ]
    entity Orders     as projection on db.Orders;

    @Common.SideEffects: {
        SourceProperties: [
            'quantity',
            'unitPrice',
            'discount'
        ],
        TargetProperties: ['totalPrice']
    }
    entity OrderItems as projection on db.OrderItems;


    entity Products   as projection on db.Products;
}
