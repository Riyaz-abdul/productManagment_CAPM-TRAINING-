namespace com.productmgmt;

using { cuid, managed } from '@sap/cds/common';

//custome data types
type Amount : Decimal(9,2); 
type AppleCategory : String enum {
    iPhone = 'IPHONE';
    Mac    = 'MAC';
    iPad   = 'IPAD';
    Watch  = 'WATCH';
    Audio  = 'AUDIO';
}

entity Products : cuid, managed {
    name        : String(100) @mandatory @assert.format : '^[A-Za-z0-9]+(?:[ A-Za-z0-9]*[A-Za-z0-9])?$'; 
    stock       : Integer;
    image       : LargeBinary @Core.MediaType: 'image/jpeg'; 
    description : String(1000);
    price       : Amount @mandatory;
    discount    : Integer @assert.range:[0,90];
    category    : AppleCategory;
}

entity Orders : cuid, managed {
    customerName   : String(100) @mandatory; 
    strorName : String @mandatory;
    customerMobile : String(20) @assert.format: '^\d+$' ;
    netPrice       : Amount;
    homeDelivery:Boolean default false;
    address : String;
    items          : Composition of many OrderItems on items.order = $self; 
}

entity OrderItems : cuid {
    order      : Association to Orders;
    product    : Association to Products;
    quantity   : Integer; 
    unitPrice  : Amount;
    discount   : Integer;
    totalPrice : Amount;
}
