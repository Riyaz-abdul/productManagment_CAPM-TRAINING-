sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/apple/ordermanagment/test/integration/pages/OrdersList.gen",
	"com/apple/ordermanagment/test/integration/pages/OrdersObjectPage.gen",
	"com/apple/ordermanagment/test/integration/pages/OrderItemsObjectPage.gen"
], function (JourneyRunner, OrdersListGenerated, OrdersObjectPageGenerated, OrderItemsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/apple/ordermanagment') + '/test/flp.html#app-preview',
        pages: {
			onTheOrdersListGenerated: OrdersListGenerated,
			onTheOrdersObjectPageGenerated: OrdersObjectPageGenerated,
			onTheOrderItemsObjectPageGenerated: OrderItemsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

