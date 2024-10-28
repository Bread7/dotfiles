"use strict";(("undefined"!=typeof self?self:global).webpackChunkclient_web=("undefined"!=typeof self?self:global).webpackChunkclient_web||[]).push([[3632],{33483:(e,t,r)=>{r.d(t,{d:()=>n});var n=new(r(33872).l)("addConcertToLibrary","mutation","c4670bb9503f201cff5a61ee426a0aa93cac0eaa1c1b9b8c66d53e058f270f7c",null)},48516:(e,t,r)=>{r.d(t,{$:()=>n});var n=new(r(33872).l)("removeConcertFromLibrary","mutation","2b6a3dc45db6b423eb36c628ccb26768f2c03e75ae274e09a1701336d46dd21d",null)},51398:(e,t,r)=>{r.d(t,{$V:()=>n,Bw:()=>i,V5:()=>l,dR:()=>c,eO:()=>s,m4:()=>d,se:()=>o,w1:()=>u,ys:()=>a});r(78551),r(5672),r(82467);var n=function(e){return"data"in e&&Object.keys(e.data).length>0},a=function(e){return"concerts"in(null!=e?e:{})},o=function(e){return null!=e},c=function(e){return"__typename"in e&&"AllEvents"===e.__typename},s=function(e){return"__typename"in e},i=function(e){return!!e&&"sections"in e},u=function(e){return"__typename"in e},l=function(e){return Object.keys(e).includes("data")},d=function(e){return void 0!==e&&Object.keys(e).includes("uri")}},31716:(e,t,r)=>{r.r(t),r.d(t,{ConcertsCarousel:()=>I,default:()=>I});r(25550),r(15342);var n=r(30758),a=r(7852),o=r(71591),c=r(4640),s=r(99),i=r(44721),u=(r(7651),r(30456),r(26701),r(37417),r(11737),r(51691),r(702),r(5672),r(43379),r(34192),r(88856),r(51565),r(18316),r(51488)),l=r(86173),d=r(63130),m=r(68113),f=r(36783),v=r(24439),h=r(86070);function b(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}var y=function(e){var t=e.artistName,r=e.artistConcertsUri,n=e.position,o=e.spec,c=(0,m.s)(),i=o.concertsCarouselFactory().allEventsCardFactory({position:n,uri:r}),u=(0,f.t)(i);return(0,h.jsx)("section",{ref:u,children:(0,h.jsx)("div",{className:v.A.cards,children:(0,h.jsx)("div",{className:v.A.allEventsCard,children:(0,h.jsxs)("div",{className:v.A.cardContent,children:[(0,h.jsx)(a.E,{as:"p",variant:"bodySmall",semanticColor:"textSubdued",className:v.A.subtitle,children:s.Ru.get("concerts_on_tour")}),(0,h.jsx)(a.E,{as:"h1",variant:"bodyMediumBold",className:v.A.title,semanticColor:"textBase",children:t}),(0,h.jsx)(d.N,{to:r,className:v.A.cardLink,onClick:function(){var e=i.hitUiNavigate({destination:r});c.logInteraction(e)},children:(0,h.jsx)(l.n,{as:"span",size:"small",className:v.A.cardButton,children:s.Ru.get("concerts_see_all_events")})})]})})})})};const p=function(e){return e.artistName&&e.artistConcertsUri?(0,h.jsx)(y,function(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?b(Object(r),!0).forEach((function(t){(0,u.A)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):b(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}({},e)):null};var j=r(5904),g=r(71523),x=(r(34518),r(64501)),C=r.n(x),O=r(55347),D=r(34064),A=r(33483),N=r(48516),w=r(59630),R=r(1131),k=r(78253);function P(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}var B=function(e,t){return e(A.d,{concertUri:t})},_=function(e,t){return e(N.$,{concertUri:t})},S=function(e){var t=e.concertUri,r=e.concertTitle,o=e.venue,c=e.imageUrl,i=e.date,u=e.spec,l=e.position,b=(0,k.d)().enqueueSnackbar,y=(0,n.useState)(e.saved),p=(0,g.A)(y,2),x=p[0],A=p[1],N=(0,n.useState)(!1),P=(0,g.A)(N,2),S=P[0],U=P[1],I=(0,w.l4)(i),E=(0,m.s)(),F=(0,(0,R.mv)().getGraphQLLoader)(),L=u.concertsCarouselFactory().concertCardFactory({position:l,uri:t}),M=(0,f.t)(L),V=function(){var e=(0,j.A)(C().mark((function e(){var r;return C().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(U(!0),r=L.interestedButtonFactory(),!S){e.next=4;break}return e.abrupt("return");case 4:if(e.prev=4,!x){e.next=13;break}return e.next=8,_(F,t);case 8:A(!1),b(s.Ru.get("concerts_removed-from-your-saved-events")),E.logInteraction(r.hitRemoveInterest()),e.next=18;break;case 13:return e.next=15,B(F,t);case 15:A(!x),b(s.Ru.get("concerts_added-to-your-saved-events")),E.logInteraction(r.hitAddInterest());case 18:return e.prev=18,U(!1),e.finish(18);case 21:case"end":return e.stop()}}),e,null,[[4,,18,21]])})));return function(){return e.apply(this,arguments)}}();return(0,h.jsx)("section",{ref:M,children:(0,h.jsx)("div",{className:v.A.cards,children:(0,h.jsxs)("div",{className:v.A.tourCard,"data-testid":"on-tour-card",children:[c&&(0,h.jsx)("img",{className:v.A.cardImage,src:c,alt:""}),(0,h.jsx)(d.N,{to:t,className:v.A.eventCard,onClick:function(){var e=L.hitUiNavigate({destination:t});E.logInteraction(e)},children:(0,h.jsxs)("div",{className:v.A.cardContent,children:[(0,h.jsx)(a.E,{as:"p",variant:"bodySmall",semanticColor:"textSubdued",className:v.A.subtitle,children:[(0,w.Y)(I),(0,w.WB)(I)].join(" • ")}),(0,h.jsx)(a.E,{as:"h1",variant:"bodyMediumBold",className:v.A.title,semanticColor:"textBase",children:r}),(0,h.jsx)(a.E,{as:"h3",variant:"bodyMediumBold",semanticColor:"textSubdued",className:v.A.venue,children:o})]})}),(0,h.jsx)("div",{className:v.A.interestedIcon,onClick:V,onKeyPress:V,role:"button",tabIndex:0,children:x?(0,h.jsx)(O.k,{semanticColor:"textBrightAccent"}):(0,h.jsx)(D.P,{semanticColor:"textBase"})})]})})})};const U=function(e){return e.concertTitle&&e.concertUri?(0,h.jsx)(S,function(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?P(Object(r),!0).forEach((function(t){(0,u.A)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):P(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}({},e)):null};const I=function(e){var t=e.liveEvents,r=e.artistConcertsUri,u=e.artistName,l=e.spec,d=(0,n.useRef)(null),f=(0,m.s)();return(0,h.jsxs)("div",{className:v.A.concertsCarousel,children:[(0,h.jsx)(a.E,{as:"h1",variant:"bodyMediumBold",semanticColor:"textBase",children:s.Ru.get("concerts")}),(0,h.jsxs)("div",{className:v.A.carouselContent,ref:d,children:[t.map((function(e,t){return(0,h.jsx)("div",{className:v.A.eventCard,children:(0,h.jsx)(U,{concertUri:e.uri,concertTitle:e.title,venue:e.venue,imageUrl:e.imageUrl,date:e.startDate,position:t+1,spec:l,saved:e.saved})},t)})),(0,h.jsx)("div",{className:v.A.eventCard,children:(0,h.jsx)(p,{artistConcertsUri:r,artistName:u,spec:l,position:t.length+1})})]}),t.length>0&&(0,h.jsxs)("div",{className:v.A.concertsCarouselControls,children:[(0,h.jsx)(i.a,{size:"sm",onClick:function(){var e;null===(e=d.current)||void 0===e||e.scrollBy({left:-420,behavior:"smooth"});var t=l.concertsCarouselFactory().previousButtonFactory().hitUiReveal();f.logInteraction(t)},icon:o.g,ariaLabel:s.Ru.get("carousel.left"),tabIndex:-1,className:v.A.carouselControlPrev}),(0,h.jsx)(i.a,{size:"sm",onClick:function(){var e;null===(e=d.current)||void 0===e||e.scrollBy({left:420,behavior:"smooth"});var t=l.concertsCarouselFactory().nextButtonFactory().hitUiReveal();f.logInteraction(t)},icon:c.V,ariaLabel:s.Ru.get("carousel.right"),tabIndex:-1,className:v.A.carouselControlNext})]})]})}},59630:(e,t,r)=>{r.d(t,{Fn:()=>f,MW:()=>v,Py:()=>d,VJ:()=>m,Vi:()=>p,WB:()=>h,WZ:()=>b,Y:()=>i,dp:()=>u,l4:()=>s,m7:()=>y,tX:()=>g,tj:()=>l});var n=r(71523),a=(r(83234),r(68216),r(2823),r(4672),r(12058)),o=r(99),c=r(51398),s=function(e){return new Date(e.substring(0,16))},i=function(e){return o.Ru.formatDate(e,{weekday:"short",month:"short",day:"numeric"})},u=function(e){return o.Ru.formatDate(e,{weekday:"short",month:"short",day:"numeric",hour:"numeric",minute:"numeric"})},l=function(e){return o.Ru.formatDate(e,{month:"short"})},d=function(e){return o.Ru.formatDate(e,{day:"numeric"})},m=function(e){return o.Ru.formatDate(e,{weekday:"short"})},f=function(e){return o.Ru.formatDate(e,{month:"short",day:"numeric"})},v=function(e){return o.Ru.formatDate(e,{weekday:"short",hour:"numeric",minute:"numeric"})},h=function(e){return o.Ru.formatDate(e,{hour:"numeric",minute:"numeric"})},b=function(e,t){if(e.toDateString()===t.toDateString())return i(e);if(e.getMonth()===t.getMonth()){var r=o.Ru.formatDate(e,{day:"numeric",month:"short"}),n=o.Ru.formatDate(t,{day:"numeric"});return"".concat(r,"–").concat(n)}var a=o.Ru.formatDate(e,{day:"numeric",month:"short"}),c=o.Ru.formatDate(t,{day:"numeric",month:"short"});return"".concat(a,"–").concat(c)},y=function(e){if(!e)return!1;var t=new Date(e);return new Date>t},p=function(e){var t=(0,n.A)(e,1)[0],r=e[e.length-1];return(0,c.$V)(t)&&(0,c.$V)(r)?{startDate:s(t.data.startDateIsoString),endDate:s(r.data.startDateIsoString)}:{startDate:new Date,endDate:new Date}},j={month:"short",day:"numeric"},g=function(e){if((0,a.r)(e.from,e.to))return o.Ru.formatDate(e.from,j);var t=o.Ru.formatDate(e.from,j).replace(/ /g," "),r=o.Ru.formatDate(e.to,j).replace(/ /g," ");return"".concat(t," - ").concat(r)}}}]);
//# sourceMappingURL=this-is-playlist-concerts-carousel.js.map