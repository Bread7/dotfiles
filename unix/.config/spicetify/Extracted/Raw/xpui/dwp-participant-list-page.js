"use strict";(("undefined"!=typeof self?self:global).webpackChunkclient_web=("undefined"!=typeof self?self:global).webpackChunkclient_web||[]).push([[987],{56428:(e,n,t)=>{t.r(n),t.d(n,{ParticipantListPage:()=>M});var i=t(71523),r=(t(40065),t(25550),t(43379),t(34192),t(4865),t(15342),t(30758)),s=t(94822),a=t(90543),o=t(7852),l=t(2860),c=t(99),u=t(77796),p=t(17781),m=t(87026),d=t(21701),b=t(68221),v=t(86070),g=function(e){var n,t,i,s=e.memberToBeRemoved,a=e.onClose,o=(0,d.R)().logRemoveClick,l=(0,b.D)(),u=l.currentSession,p=l.removeSessionMember,g=null!==(n=null==s?void 0:s.id)&&void 0!==n?n:"",f=null!==(t=null==s?void 0:s.displayName)&&void 0!==t?t:"",y=null!==(i=null==u?void 0:u.sessionId)&&void 0!==i?i:"",h=(0,r.useCallback)((function(){o(g,y),g&&(p(g),a())}),[o,g,y,p,a]),w=(0,r.useCallback)((function(){a()}),[a]);return(0,v.jsx)(m.T,{isOpen:Boolean(g),titleText:c.Ru.get("web-player.social-connect.participant-list.remove-guest-dialog",{displayName:f}),"aria-label":c.Ru.get("web-player.social-connect.participant-list.remove-guest-dialog",{displayName:f}),confirmText:c.Ru.get("web-player.social-connect.participant-list.remove-guest"),cancelText:c.Ru.get("web-player.social-connect.participant-list.remove-guest-cancel"),onConfirm:h,onClose:w})},f=t(86173),y=t(6037),h=t(40521),w=t(35680),j=t(59414),x=t(64396),C=t(63130),R=t(4813);const k="VaoPVkde4AzxorQnp6Jp",O="dDz8CzVKiV2128rhR543",I="tBAiRbWhD79Gi2XqZ_AG";var N=function(e){var n=e.sessionMember,t=e.index,i=e.showRemoveButton,r=e.onClickRemove,s=e.onClickMember,a=(0,R.c)(n),l=a.displayName,u=a.images,p=a.uri,m=a.username;return(0,v.jsx)(j.h,{menu:(0,v.jsx)(x.B,{uri:p}),children:(0,v.jsx)("span",{children:(0,v.jsxs)(h.$,{rowIndex:t,className:k,children:[(0,v.jsx)(y.T,{columnIndex:0,children:(0,v.jsxs)(C.N,{to:p,className:I,onClick:s,"aria-label":l,children:[(0,v.jsx)(w.e,{images:u,userIconSize:"medium",width:32,displayName:l,username:m,label:l}),(0,v.jsx)(o.E,{as:"p",variant:"bodyMediumBold",semanticColor:"textBase",children:l})]})}),i&&(0,v.jsx)(y.T,{columnIndex:1,className:O,children:(0,v.jsx)(f.n,{size:"small",onClick:r,"aria-label":c.Ru.get("web-player.social-connect.participant-list.remove-guest-accessible-label",{displayName:l}),children:c.Ru.get("web-player.social-connect.participant-list.remove-guest")})})]})})})},B=t(503);const S="qAE8wMAxO5THZoNqlb0q";var M=function(){var e=(0,s.d4)((function(e){var n;return null===(n=e.session.user)||void 0===n?void 0:n.id})),n=(0,b.D)().currentSession,t=(0,r.useState)(),m=(0,i.A)(t,2),d=m[0],f=m[1],y=(0,B.T)(),h=y.logUserClick,w=y.logRemoveClick,j=y.UBIFragmentWithSpec,x=(0,r.useCallback)((function(e,n){w(e),f(n)}),[w]),C=(0,r.useCallback)((function(e,n){var t=(0,l.Qjr)(n.username).toURI();h(e,t)}),[h]),R=(0,r.useCallback)((function(){f(void 0)}),[]),k=null==n?void 0:n.sessionMembers.find((function(e){return e.id===n.sessionOwnerId}));if(!n||!k)return(0,v.jsx)(a.C5,{to:"/queue"});var O=n.isSessionOwner?2:1;return(0,v.jsxs)("section",{className:"contentSpacing",children:[(0,v.jsx)(p.Q,{children:c.Ru.get("web-player.social-connect.participant-list.title",{host:k.displayName})}),(0,v.jsx)(o.E,{as:"h1",variant:"titleSmall",semanticColor:"textBase",children:c.Ru.get("web-player.social-connect.participant-list.title")}),(0,v.jsx)(o.E,{as:"h2",variant:"bodyMediumBold",semanticColor:"textSubdued",children:c.Ru.get("web-player.social-connect.participant-list.subtitle")}),(0,v.jsx)(u.f,{"aria-colcount":O,"aria-rowcount":n.sessionMembers.length,"aria-label":c.Ru.get("web-player.social-connect.participant-list.title"),className:S,children:n.sessionMembers.map((function(t,i){return(0,v.jsx)(N,{sessionMember:t,showRemoveButton:n.isSessionOwner&&t.username!==e,index:i,onClickRemove:function(){return x(i,t)},onClickMember:function(){return C(i,t)}},t.displayName)}))}),(0,v.jsx)(j,{children:(0,v.jsx)(g,{memberToBeRemoved:d,onClose:R})})]})}},503:(e,n,t)=>{t.d(n,{T:()=>c});t(7651),t(30456),t(26701),t(37417),t(11737),t(51691),t(702),t(5672),t(43379),t(34192),t(88856),t(51565),t(18316);var i=t(51488),r=t(30758),s=t(35929),a=t(57965),o=t(86070);function l(e,n){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var i=Object.getOwnPropertySymbols(e);n&&(i=i.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),t.push.apply(t,i)}return t}var c=function(){var e=(0,a.r)(s.I,{}),n=e.spec,t=e.logger,c=e.UBIFragment,u=(0,r.useCallback)((function(e,i){t.logInteraction(n.participantListFactory().participantListRowFactory({position:e}).userLinkFactory().hitUiNavigate({destination:i}))}),[t,n]),p=(0,r.useCallback)((function(e){t.logInteraction(n.participantListFactory().participantListRowFactory({position:e}).removeButtonFactory().hitUiReveal())}),[t,n]),m=(0,r.useCallback)((function(e){return(0,o.jsx)(c,function(e){for(var n=1;n<arguments.length;n++){var t=null!=arguments[n]?arguments[n]:{};n%2?l(Object(t),!0).forEach((function(n){(0,i.A)(e,n,t[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):l(Object(t)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n))}))}return e}({spec:n},e))}),[c,n]);return{logUserClick:u,logRemoveClick:p,UBIFragmentWithSpec:m}}},4813:(e,n,t)=>{t.d(n,{c:()=>a,t:()=>o});var i=t(22507),r=(t(83234),t(30456),t(40065),t(25550),t(43379),t(34192),t(88856),t(4865),t(15342),t(2860)),s=function(e){return{url:e}},a=function(e){var n=[];return e.largeImageUrl?n.push(s(e.largeImageUrl)):e.imageUrl&&n.push(s(e.imageUrl)),{displayName:e.displayName,images:n,username:e.username,uri:(0,r.Qjr)(e.username).toURI()}},o=function(e,n,t){var r=[],s=e.sessionMembers.find((function(n){return n.id===e.sessionOwnerId}));s&&r.push(s);var o=e.isSessionOwner||null==e?void 0:e.sessionMembers.find((function(e){return e.username===n}));o&&(null!=t&&t.userFirst?r.unshift(o):r.push(o));var l=e.sessionMembers.filter((function(t){var i=t.username;return t.id!==e.sessionOwnerId&&i!==n}));return[].concat(r,(0,i.A)(l)).map(a)}},21701:(e,n,t)=>{t.d(n,{R:()=>a});var i=t(30758),r=t(39208),s=t(57965),a=function(){var e=(0,s.r)(r.T,{}),n=e.spec,t=e.logger;return{logRemoveClick:(0,i.useCallback)((function(e,i){t.logInteraction(n.buttonRowFactory().removeButtonFactory().hitRemoveParticipant({participantId:e,sessionId:i}))}),[t,n])}}}}]);
//# sourceMappingURL=dwp-participant-list-page.js.map