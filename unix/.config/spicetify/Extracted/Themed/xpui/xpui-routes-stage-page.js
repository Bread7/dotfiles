"use strict";(("undefined"!=typeof self?self:global).webpackChunkclient_web=("undefined"!=typeof self?self:global).webpackChunkclient_web||[]).push([[5523],{61941:(e,t,n)=>{n.r(t),n.d(t,{default:()=>ue});var r=n(71523),a=n(30758),i=n(90543),o=n(40904),u=n(65277),c=n(99),s=n(18367),l=n(96974),d=(n(42486),n(79024),n(68216),n(43379),n(78397),n(97460),n(93577),n(5728),n(24136),n(54520),n(91531),n(93678),n(34145),n(33177),n(67891)),f=n(5904),p=n(64501),h=n.n(p),g=n(52067),v=n(36136),I=n(24870),E=null,b=(0,n(97983).h)(),N="sp://auth/v1/token_web_auth";function S(e){return T.apply(this,arguments)}function T(){return(T=(0,f.A)(h().mark((function e(t){var n;return h().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(t){e.next=2;break}return e.abrupt("return",void 0);case 2:return(n=new URL(N)).searchParams.append("audience",t),e.next=6,b.get(n.toString());case 6:return e.abrupt("return",e.sent);case 7:case"end":return e.stop()}}),e)})))).apply(this,arguments)}const y="NWSmcn03uY8Fosh_mYCi",O="N9ngMcd9oSDEd8zK5jBj",k="kYOJhuJ996EIMXFJD3By";var C=n(86070),D=function(e){var t=e.url,n=function(e){var t=(0,g.S)((function(e){return e.setStatus})),n=(0,a.useState)(""),i=(0,r.A)(n,2),o=i[0],u=i[1],c=(0,a.useCallback)((0,f.A)(h().mark((function n(){var r;return h().wrap((function(n){for(;;)switch(n.prev=n.next){case 0:if(!e){n.next=6;break}return t(v.Z.AUTHENTICATION_STARTED),n.next=4,S(e).catch((function(e){throw(E||(E=I.logger),E).error("error: could not fetch IDT token!"),t(v.Z.AUTHENTICATION_FAILED),e}));case 4:(r=n.sent)&&(t(v.Z.AUTHENTICATION_SUCCEEDED),u(r.accessToken));case 6:case"end":return n.stop()}}),n)}))),[e,t]);return(0,a.useEffect)((function(){e&&c()}),[e,c]),o}(e.clientId),i=function(){var e=(0,d.k)();if(e){var t=e.containerVersion;return t.substring(0,t.lastIndexOf("."))}}(),o="";return t&&i&&(o=function(e,t,n){var r=new URL(e);r.searchParams.append("utm_app_version",t),n&&(r.hash="#id_token=".concat(n));return r.toString()}(t,i,n)),(0,C.jsx)("div",{className:y,children:(0,C.jsx)("iframe",{title:c.Ru.get("web-player.the-stage.title"),name:"stage-view-frame",id:O,src:o,sandbox:"allow-scripts allow-same-origin"})})};n(77905);var A=n(97500),w=n.n(A),L=n(99299),R=function(){var e=(0,a.useContext)(L.bi).scrollNodeChildRef;(0,a.useEffect)((function(){var t,n=null==e?void 0:e.current,r=null==e||null===(t=e.current)||void 0===t?void 0:t.className;return n&&(n.className=w()(r,k)),function(){n&&(n.className=w()(r))}}),[e])},m=n(79655),P=n(36560),B=n(73996),j=P.$S.PANEL_CLOSE_CLICK,_=(n(78551),n(26851),n(9750),n(5672),n(82467),n(20031),n(2860)),x=n(78253),Z=n(94822);var G=n(59570);function V(e,t){var n,r,o,u,s=(0,a.useRef)(),l=(0,a.useMemo)((function(){return new AbortController}),[]),d=l.signal,f=(n=(0,i.Zp)(),r=(0,Z.d4)((function(e){return e.ui.history.canGoBack})),(0,a.useCallback)((function(){n(r?-1:"/")}),[n,r])),p=(o=(0,g.S)((function(e){return e.setStatus})),u=(0,x.d)().enqueueSnackbar,{onSuccess:function(){u(c.Ru.get("feedback.link-copied")),o(v.Z.SHARE_EVENT)},onError:function(e){u(c.Ru.get("error.generic")),o(v.Z.ERROR)}}),h=(0,a.useCallback)((function(n){if(e&&e.includes(n.origin)){var r=JSON.parse(n.data);"didRequestInitialize"===r.type?(s.current={source:n.source,options:{targetOrigin:n.origin}},function(e){var t=e.source,n=e.options,r=JSON.stringify({type:"ready",capabilities:{}});t.postMessage(r,n)}(s.current)):"didRequestIDToken"===r.type?(s.current={source:n.source,options:{targetOrigin:n.origin}},function(e,t){U.apply(this,arguments)}(s.current,t)):"didRequestClose"===r.type?f():"didRequestShare"===r.type&&function(e,t,n){M.apply(this,arguments)}(s.current,r,p)}}),[e,t,p,f]);(0,a.useEffect)((function(){return e&&window.addEventListener("message",(function(e){return h(e)}),{signal:d}),function(){l.abort()}}),[e,l,h,d])}function U(){return(U=(0,f.A)(h().mark((function e(t,n){var r,a,i,o;return h().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return r=t.source,a=t.options,e.next=3,S(n);case 3:if(i=e.sent){e.next=6;break}return e.abrupt("return");case 6:if(i.accessToken){e.next=9;break}return e.abrupt("return");case 9:o=JSON.stringify({type:"didReceiveIDToken",token:i.accessToken}),r.postMessage(o,a);case 11:case"end":return e.stop()}}),e)})))).apply(this,arguments)}function M(){return(M=(0,f.A)(h().mark((function e(t,n,r){var a,i,o,u,c;return h().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(a=t.source,i=t.options,"didRequestShare"===n.type){e.next=3;break}return e.abrupt("return");case 3:return(u=(0,_.o_h)(n.url))&&(o=u.toURL()),e.next=7,(0,G.l)(o).catch((function(e){throw r.onError(e),e}));case 7:r.onSuccess(),c={type:"didDismissShare",requestId:n.requestId},a.postMessage(JSON.stringify(c),i);case 10:case"end":return e.stop()}}),e)})))).apply(this,arguments)}var K=n(64654);var J=n(44671),H=(n(7651),n(30456),n(26701),n(37417),n(11737),n(51691),n(702),n(34192),n(88856),n(51565),n(18316),n(51488)),q=(n(25550),n(28169),n(15342),function(e){return e[e.NONE=0]="NONE",e[e.STT=1]="STT",e[e.IDT=2]="IDT",e[e.UNRECOGNIZED=-1]="UNRECOGNIZED",e}({}));function Y(e){switch(e){case 0:case"NONE":return q.NONE;case 1:case"STT":return q.STT;case 2:case"IDT":return q.IDT;default:return q.UNRECOGNIZED}}var F=function(e){return e[e.INVALID=0]="INVALID",e[e.VALID=1]="VALID",e[e.ACTIVE=2]="ACTIVE",e[e.UNRECOGNIZED=-1]="UNRECOGNIZED",e}({});function z(e){switch(e){case 0:case"INVALID":return F.INVALID;case 1:case"VALID":return F.VALID;case 2:case"ACTIVE":return F.ACTIVE;default:return F.UNRECOGNIZED}}var W=function(e){return e[e.ALCOHOL=0]="ALCOHOL",e[e.ENERGY_DRINKS=1]="ENERGY_DRINKS",e[e.UNRECOGNIZED=-1]="UNRECOGNIZED",e}({});var X={fromJSON:function(e){return{id:Q(e.id)?globalThis.String(e.id):"0",campaignId:Q(e.campaignId)?globalThis.String(e.campaignId):"0",lookupToken:Q(e.lookupToken)?globalThis.String(e.lookupToken):"",url:Q(e.url)?globalThis.String(e.url):"",authType:Q(e.authType)?Y(e.authType):0,clientId:Q(e.clientId)?globalThis.String(e.clientId):void 0,hasAudio:!!Q(e.hasAudio)&&globalThis.Boolean(e.hasAudio),status:Q(e.status)?z(e.status):0,restricted:!!Q(e.restricted)&&globalThis.Boolean(e.restricted),gcpProjectId:Q(e.gcpProjectId)?globalThis.String(e.gcpProjectId):"",defaultLocale:Q(e.defaultLocale)?globalThis.String(e.defaultLocale):"",restrictions:globalThis.Array.isArray(null==e?void 0:e.restrictions)?e.restrictions.map((function(e){return function(e){switch(e){case 0:case"ALCOHOL":return W.ALCOHOL;case 1:case"ENERGY_DRINKS":return W.ENERGY_DRINKS;default:return W.UNRECOGNIZED}}(e)})):[],enableLegacySharing:!!Q(e.enableLegacySharing)&&globalThis.Boolean(e.enableLegacySharing),hidePlayer:!!Q(e.hidePlayer)&&globalThis.Boolean(e.hidePlayer),legacyBackBehavior:!!Q(e.legacyBackBehavior)&&globalThis.Boolean(e.legacyBackBehavior),enableCheckout:!!Q(e.enableCheckout)&&globalThis.Boolean(e.enableCheckout),allowedCountries:globalThis.Array.isArray(null==e?void 0:e.allowedCountries)?e.allowedCountries.map((function(e){return globalThis.String(e)})):[],restoreOnKilled:!!Q(e.restoreOnKilled)&&globalThis.Boolean(e.restoreOnKilled),enableMediaDevices:!!Q(e.enableMediaDevices)&&globalThis.Boolean(e.enableMediaDevices)}},toJSON:function(e){var t,n,r={};return"0"!==e.id&&(r.id=e.id),"0"!==e.campaignId&&(r.campaignId=e.campaignId),""!==e.lookupToken&&(r.lookupToken=e.lookupToken),""!==e.url&&(r.url=e.url),0!==e.authType&&(r.authType=function(e){switch(e){case q.NONE:return"NONE";case q.STT:return"STT";case q.IDT:return"IDT";case q.UNRECOGNIZED:default:return"UNRECOGNIZED"}}(e.authType)),void 0!==e.clientId&&(r.clientId=e.clientId),!1!==e.hasAudio&&(r.hasAudio=e.hasAudio),0!==e.status&&(r.status=function(e){switch(e){case F.INVALID:return"INVALID";case F.VALID:return"VALID";case F.ACTIVE:return"ACTIVE";case F.UNRECOGNIZED:default:return"UNRECOGNIZED"}}(e.status)),!1!==e.restricted&&(r.restricted=e.restricted),""!==e.gcpProjectId&&(r.gcpProjectId=e.gcpProjectId),""!==e.defaultLocale&&(r.defaultLocale=e.defaultLocale),null!==(t=e.restrictions)&&void 0!==t&&t.length&&(r.restrictions=e.restrictions.map((function(e){return function(e){switch(e){case W.ALCOHOL:return"ALCOHOL";case W.ENERGY_DRINKS:return"ENERGY_DRINKS";case W.UNRECOGNIZED:default:return"UNRECOGNIZED"}}(e)}))),!1!==e.enableLegacySharing&&(r.enableLegacySharing=e.enableLegacySharing),!1!==e.hidePlayer&&(r.hidePlayer=e.hidePlayer),!1!==e.legacyBackBehavior&&(r.legacyBackBehavior=e.legacyBackBehavior),!1!==e.enableCheckout&&(r.enableCheckout=e.enableCheckout),null!==(n=e.allowedCountries)&&void 0!==n&&n.length&&(r.allowedCountries=e.allowedCountries),!1!==e.restoreOnKilled&&(r.restoreOnKilled=e.restoreOnKilled),!1!==e.enableMediaDevices&&(r.enableMediaDevices=e.enableMediaDevices),r},create:function(e){return X.fromPartial(null!=e?e:{})},fromPartial:function(e){var t,n,r,a,i,o,u,c,s,l,d,f,p,h,g,v,I,E,b,N={id:"0",campaignId:"0",lookupToken:"",url:"",authType:0,clientId:void 0,hasAudio:!1,status:0,restricted:!1,gcpProjectId:"",defaultLocale:"",restrictions:[],enableLegacySharing:!1,hidePlayer:!1,legacyBackBehavior:!1,enableCheckout:!1,allowedCountries:[],restoreOnKilled:!1,enableMediaDevices:!1};return N.id=null!==(t=e.id)&&void 0!==t?t:"0",N.campaignId=null!==(n=e.campaignId)&&void 0!==n?n:"0",N.lookupToken=null!==(r=e.lookupToken)&&void 0!==r?r:"",N.url=null!==(a=e.url)&&void 0!==a?a:"",N.authType=null!==(i=e.authType)&&void 0!==i?i:0,N.clientId=null!==(o=e.clientId)&&void 0!==o?o:void 0,N.hasAudio=null!==(u=e.hasAudio)&&void 0!==u&&u,N.status=null!==(c=e.status)&&void 0!==c?c:0,N.restricted=null!==(s=e.restricted)&&void 0!==s&&s,N.gcpProjectId=null!==(l=e.gcpProjectId)&&void 0!==l?l:"",N.defaultLocale=null!==(d=e.defaultLocale)&&void 0!==d?d:"",N.restrictions=(null===(f=e.restrictions)||void 0===f?void 0:f.map((function(e){return e})))||[],N.enableLegacySharing=null!==(p=e.enableLegacySharing)&&void 0!==p&&p,N.hidePlayer=null!==(h=e.hidePlayer)&&void 0!==h&&h,N.legacyBackBehavior=null!==(g=e.legacyBackBehavior)&&void 0!==g&&g,N.enableCheckout=null!==(v=e.enableCheckout)&&void 0!==v&&v,N.allowedCountries=(null===(I=e.allowedCountries)||void 0===I?void 0:I.map((function(e){return e})))||[],N.restoreOnKilled=null!==(E=e.restoreOnKilled)&&void 0!==E&&E,N.enableMediaDevices=null!==(b=e.enableMediaDevices)&&void 0!==b&&b,N}};var $={fromJSON:function(e){return{site:Q(e.site)?X.fromJSON(e.site):void 0}},toJSON:function(e){var t={};return void 0!==e.site&&(t.site=X.toJSON(e.site)),t},create:function(e){return $.fromPartial(null!=e?e:{})},fromPartial:function(e){var t={site:void 0};return t.site=void 0!==e.site&&null!==e.site?X.fromPartial(e.site):void 0,t}};function Q(e){return null!=e}var ee=n(71007);function te(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function ne(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?te(Object(n),!0).forEach((function(t){(0,H.A)(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):te(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}var re=function(){var e=(0,f.A)(h().mark((function e(t,n){return h().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,t.build().withHost("".concat(ee.sp)).withMethod("GET").withoutMarket().withPath("/site/".concat(n)).withEndpointIdentifier("/site/{lookupId}").withJsonContentType().send().then((function(e){return ne(ne({},e),{},{body:$.fromJSON(e.body)})}));case 2:return e.abrupt("return",e.sent);case 3:case"end":return e.stop()}}),e)})));return function(t,n){return e.apply(this,arguments)}}(),ae=n(46908),ie=function(e){var t,n,r=[e],a=(t=(0,g.S)((function(e){return e.setStatus})),{onStart:function(){return t(v.Z.RESOLVING_SITE_STARTED)},onSuccess:function(){return t(v.Z.RESOLVING_SITE_SUCCEEDED)},onError:function(e){t(v.Z.RESOLVING_SITE_FAILED)}}),i=a.onStart,o=a.onSuccess,u=a.onError,c=(0,J.I)({queryKey:r,queryFn:(n=(0,f.A)(h().mark((function t(){return h().wrap((function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,re(ae.n.getInstance(),e);case 2:return t.abrupt("return",t.sent);case 3:case"end":return t.stop()}}),t)}))),function(){return n.apply(this,arguments)}),staleTime:6e5,gcTime:18e5}),s=c.data,l=c.error,d=c.isLoading,p=c.isError;return d?i():p?u(l):o(),{data:null==s?void 0:s.body.site,loading:d,isError:p}},oe=n(49093);const ue=function(e){var t,n,d,f,p,h;R(),t=(0,m.AI)(B.Z.NowPlayingView),n=t.isActive,d=t.panelSend,n&&d(j),h=(0,K.z)(),null===(f=h.getState())||void 0===f||!f.hasContext||null!==(p=h.getState())&&void 0!==p&&p.isPaused||h.pause();var I=(0,i.g)().lookupToken,E=void 0===I?"":I,b=ie(E),N=b.loading,S=b.data,T=b.isError,y=(0,a.useState)((0,o.A)());return function(e,t){var n=(0,g.S)((function(e){return e.setStatus})),r=(0,g.S)((function(e){return e.setSession})),i=(0,g.S)((function(e){return e.resetSession})),o=(0,a.useCallback)(n,[n]),u=(0,a.useCallback)(r,[r]),c=(0,a.useCallback)(i,[i]);(0,a.useEffect)((function(){return u({siteId:e,sessionId:t,startTime:Date.now()}),o(v.Z.PRESENTED),function(){o(v.Z.DISMISSED),c()}}),[c,u,o,t,e])}(E,(0,r.A)(y,1)[0]),V(null==S?void 0:S.url,null==S?void 0:S.clientId),(0,u.NC)(oe.n2U)?(0,C.jsx)(s.s,{children:N?(0,C.jsx)(l.LoadingPage,{hasError:T,errorMessage:c.Ru.get("error.generic")}):(0,C.jsx)(D,{url:null==S?void 0:S.url,clientId:null==S?void 0:S.clientId})}):(0,C.jsx)(l.LoadingPage,{hasError:T,errorMessage:c.Ru.get("error.not_found.title.page")})}},67891:(e,t,n)=>{n.d(t,{k:()=>o});var r=n(71523),a=n(30758),i=n(28516);function o(){var e=(0,i.t)(),t=(0,a.useState)(null),n=(0,r.A)(t,2),o=n[0],u=n[1];return(0,a.useEffect)((function(){var t=!0;return e.getVersionInfo().then((function(e){t&&u(e)})),function(){t=!1}}),[e,u]),o}}}]);
//# sourceMappingURL=xpui-routes-stage-page.js.map