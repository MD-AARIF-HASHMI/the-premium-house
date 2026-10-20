# Research & comparison notes

## Flipkart
Official Flipkart pages show:
- delivery, login/account, refunds, payments, returns/pickup and cancellation as major help topics;
- order management and return/refund tracking;
- wishlist, orders, rewards/gift cards, notifications and customer care in the account/navigation experience;
- category discovery, personalized suggestions, offers and filters;
- search/filter and AI-assisted discovery as part of its shopping technology direction.

Source:
https://www.flipkart.com/helpcentre
https://www.flipkart.com/
https://stories.flipkart.com/technology-smart-shopping-flipkart-app

## Amazon / Buy with Prime
Amazon's official Buy with Prime design documentation identifies:
- delivery estimate cards;
- order management;
- shipment tracking;
- returns;
- customer support;
- order details containing purchased items, payment method and estimated delivery.

Source:
https://documents.partners.buywithprime.amazon.com/public/docs/manage-order-details
https://documents.partners.buywithprime.amazon.com/public/docs/manage-returns

## SHEIN
Official SHEIN help material identifies:
- product-page Size Guide;
- Check My Size / Fit Finder on supported products;
- model measurements where available;
- tracking from My Orders / Track;
- returns and refund status from Order Details;
- return eligibility that can vary by product/seller.

Source:
https://m.shein.com/pt/How-to-choose-your-size-a-748.html
https://us.shein.com/faq/detail?id=21338
https://us.shein.com/faq/list?content=missing+items

## Product decisions adopted
1. Put delivery ETA and return/authenticity trust signals directly on PDP.
2. Keep size guide and fit-check close to size selection.
3. Make order tracking and returns first-class post-purchase destinations.
4. Keep cart and checkout transparent with discount/delivery/total breakdown.
5. Provide search suggestions and fast product discovery.
6. Use mobile bottom-navigation/account patterns in the production version.
7. Keep premium visual language original instead of copying competitor layouts.

## Not implemented in this standalone UI package
- Real payment gateway
- Real carrier map
- Real seller/admin dashboards
- Server-side cart/order/payment persistence
- Real-time inventory
- Production notifications
- Recommendation/AI services

Those belong to the backend/product implementation phases.
