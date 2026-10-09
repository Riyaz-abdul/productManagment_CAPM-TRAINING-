using {com.productmgmt as db} from '../db/schema';

service ProductMgmt {
    @odata.draft.enabled
    // @requires:['owner']
    @restrict:[
        {
            grant : ['*'],
            to : 'owner'
        },
        {
            grant : ['READ'],
            to : 'employee'
        }
    ]
    entity Products   as
        projection on db.Products {
            *,
            case
                when stock = 0
                     then 'out of stock'
                when stock < 10
                     then 'few stocks available'
                else 'yes available'
            end as status      : String(30),

            case
                when stock = 0
                     then 1
                when stock < 10
                     then 2
                when stock > 10
                     then 3

            end as criticality : Integer
        }
        actions {
            action AddDiscount(dis :Int16 @common.Label :'Add Discount') returns String;
            @Common.SideEffects:{
              TargetProperties : ['status','stock','criticality']
            }
             @Core.OperationAvailable: (:in.stock < 10)
            action AddStock(in:$self ,stock:Int16 @common.Label: 'ADD stock' ) returns String;
        }

    entity Orders     as projection on db.Orders;

    entity OrderItems as projection on db.OrderItems;


}
