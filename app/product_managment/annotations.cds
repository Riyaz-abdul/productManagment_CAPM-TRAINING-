using ProductMgmt as service from '../../srv/prd-mgmt';
annotate service.Products with @(
    UI.SelectionFields : [
        category,
        discount,
        price,
    ],
    UI.LineItem : {

    @UI.Criticality : criticality,

     $value : [
        {
            $Type : 'UI.DataField',
            Value : image,
            Label : 'image',
        },

        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Label : 'status',
            Criticality : criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Value : category,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'stock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ProductMgmt.AddStock',
            Label : 'AddStock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'ProductMgmt.AddDiscount',
            Label : 'AddDiscount',
        },
        
    ],
    },
    UI.DataPoint #name : {
        $Type : 'UI.DataPointType',
        Value : name,
        Title : 'name',
    },
    UI.DataPoint #price : {
        $Type : 'UI.DataPointType',
        Value : price,
        Title : 'price',
    },
    UI.DataPoint #stock : {
        $Type : 'UI.DataPointType',
        Value : stock,
        Title : 'stock',
    },
    UI.DataPoint #image : {
        $Type : 'UI.DataPointType',
        Value : image,
        Title : 'image',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ID',
            Target : '@UI.DataPoint#ID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'price',
            Target : '@UI.DataPoint#price1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'stock',
            Target : '@UI.DataPoint#stock1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'status',
            Target : '@UI.DataPoint#status',
        },
    ],
    UI.FieldGroup #Productdetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : category,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
                Label : 'description',
            },
            {
                $Type : 'UI.DataField',
                Value : discount,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'stock',
            },
        ],
    },
    UI.FieldGroup #attachment : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : image,
                Label : 'image',
            },
        ],
    },
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : 'Product',
        TypeNamePlural : 'Products',
        ImageUrl : image,
        Description : {
            $Type : 'UI.DataField',
            Value : description,
        },
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product details',
            ID : 'Productdetails',
            Target : '@UI.FieldGroup#Productdetails1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Attachment',
            ID : 'Attachment',
            Target : '@UI.FieldGroup#Attachment',
        },
    ],
    UI.FieldGroup #Productdetails1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : category,
            },
            {
                $Type : 'UI.DataField',
                Value : discount,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'stock',
            },
        ],
    },
    UI.FieldGroup #Attachment : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : image,
                Label : 'image',
            },
        ],
    },
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'ID',
    },
    UI.DataPoint #price1 : {
        $Type : 'UI.DataPointType',
        Value : price,
        Title : 'price',
    },
    UI.DataPoint #stock1 : {
        $Type : 'UI.DataPointType',
        Value : stock,
        Title : 'stock',
    },
    UI.DataPoint #status : {
        $Type : 'UI.DataPointType',
        Value : status,
        Title : 'status',
    },
);

annotate service.Products with {
    category @Common.Label : 'category';
      discount @Common.Label : 'discount';
       price @Common.Label : 'price'
};



