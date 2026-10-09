using orderMgnt as service from '../../srv/ord-mgnt';
annotate service.Orders with @(
    UI.SelectionFields : [
        ID,
        netPrice,
        strorName,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : strorName,
        },
        {
            $Type : 'UI.DataField',
            Value : customerName,
            Label : 'customerName',
        },
        {
            $Type : 'UI.DataField',
            Value : netPrice,
        },
    ],
    UI.HeaderInfo : {
        TypeName : 'Order',
        TypeNamePlural : 'Orders',
        Title : {
            $Type : 'UI.DataField',
            Value : ID,
        },
        TypeImageUrl : 'sap-icon://sales-order',
        Description : {
            $Type : 'UI.DataField',
            Value : netPrice,
        },
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'order information',
            ID : 'orderinformation',
            Target : '@UI.FieldGroup#orderinformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'item details',
            ID : 'itemdetails',
            Target : 'items/@UI.LineItem#itemdetails',
        },
    ],
    UI.FieldGroup #orderinformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : customerMobile,
                Label : 'customerMobile',
            },
            {
                $Type : 'UI.DataField',
                Value : netPrice,
            },
            {
                $Type : 'UI.DataField',
                Value : strorName,
            },
            {
                $Type : 'UI.DataField',
                Value : customerName,
                Label : 'customerName',
            },
        ],
    },
);
annotate service.Orders with {
    address @UI.MultiLineText;
     address @Common.FieldControl: ( homeDelivery = true? #Mandatory : #ReadOnly );
    address @UI.Hidden: ( homeDelivery = false );
};

annotate service.Orders with {
    ID @Common.Label : 'ID'
};

annotate service.Orders with {
    netPrice @Common.Label : 'netPrice'
};

annotate service.Orders with {
    strorName @Common.Label : 'strorName'
};

annotate service.OrderItems with @(
    UI.LineItem #itemdetails : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : order_ID,
            Label : 'order_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : unitPrice,
            Label : 'unitPrice',
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID,
            Label : 'product_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
            Label : 'discount',
        },
        {
            $Type : 'UI.DataField',
            Value : totalPrice,
            Label : 'totalPrice',
        },
    ]
);

annotate service.OrderItems with {
    product @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'stock',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'price',
                    LocalDataProperty : unitPrice,
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'discount',
                    LocalDataProperty : discount,
                },
            ],
            Label : 'SELECT PRODUCT',
        },
        Common.ValueListWithFixedValues : true,
)};

