"use strict";(("undefined"!=typeof self?self:global).webpackChunkclient_web=("undefined"!=typeof self?self:global).webpackChunkclient_web||[]).push([[8828],{86287:(e,t,r)=>{r.d(t,{s:()=>k});var n=r(22507),i=r(51488),l=r(48),a=(r(7651),r(83234),r(30456),r(26701),r(78551),r(25550),r(37417),r(11737),r(51691),r(702),r(5672),r(43379),r(82467),r(34192),r(88856),r(51565),r(15342),r(18316),r(30758)),o=r(97500),s=r.n(o),c=r(20087),u=r(94389),d=r(62205),f=r(90597);const g="IVnoxrO3iL_tz5ULI8g_";var m=r(86070),p=["filterId","isPrimaryFilter","isPlaceholder","resetFilterIds","toggleFilterId","className","innerRef","onFilterClick","index"],y=["filterId","isPlaceholder","resetFilterIds","toggleFilterId","className","innerRef","onFilterClick","index"];function v(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function b(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?v(Object(r),!0).forEach((function(t){(0,i.A)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):v(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var h={marginBlockEnd:0,willChange:"transform, opacity"},x=function(e){var t=e.filterId,r=void 0===t?null:t,n=e.isPrimaryFilter,o=e.isPlaceholder,u=e.resetFilterIds,d=e.toggleFilterId,f=e.className,y=e.innerRef,v=e.onFilterClick,x=e.index,j=void 0===x?0:x,k=(0,l.A)(e,p),S=k.selected,A=(0,a.useCallback)((function(){if(!r)return u(),void v(null,!1,j);v(r,!!S,j),d(r)}),[r,u,d,v,S,j]),C=(0,a.useCallback)((function(e){e.detail>1||o||A()}),[o,A]);return(0,m.jsx)(c.v,b(b({},k),{},{className:s()(f,(0,i.A)({},g,o)),onClick:C,selectedColorSet:"invertedLight",secondary:S&&!n,style:h,ref:y,tabIndex:-1}))},j=function(e){var t=e.filterId,r=void 0===t?null:t,n=e.isPlaceholder,o=e.resetFilterIds,c=e.toggleFilterId,d=e.className,f=e.innerRef,p=e.onFilterClick,v=e.index,x=void 0===v?0:v,j=(0,l.A)(e,y),k=j.selected,S=(0,a.useCallback)((function(){if(!r)return o(),void p(null,!1,x);p(r,!!k,x),c(r)}),[r,o,c,p,k,x]),A=(0,a.useCallback)((function(e){e.detail>1||n||S()}),[n,S]);return(0,m.jsx)(u.m,b(b({},j),{},{"aria-label":j["aria-label"],className:s()(d,(0,i.A)({},g,n)),onClick:A,style:h,ref:f,tabIndex:-1}))},k=(0,a.memo)((function(e){var t=e.placeholderFilters,r=void 0===t?[]:t,i=e.availableFilters,l=e.selectedFilters,o=e.toggleFilterId,s=e.resetFilterIds,c=e.onFilterClick,u=e.ariaLabel,g=e.clearBtnAriaLabel,p=e.className,y=e.applyLightThemeControls,v=void 0!==y&&y,b=!(l||i),h=b?r:[].concat((0,n.A)(null!=l?l:[]),(0,n.A)(null!=i?i:[])),k=(0,a.useRef)(null),S=(0,a.useCallback)((function(){var e,t;(0,f.MS)(k.current,(null===(e=k.current)||void 0===e?void 0:e.nextElementSibling)instanceof HTMLElement?null===(t=k.current)||void 0===t?void 0:t.nextElementSibling:null),s()}),[s]);return 0===h.length?null:(0,m.jsxs)(d.FN,{className:p,ariaLabel:u,applyLightThemeControls:v,children:[!(null==l||!l.length)&&(0,m.jsx)(j,{resetFilterIds:S,toggleFilterId:o,onFilterClick:c,"aria-label":null!=g?g:u,innerRef:k}),h.map((function(e,t){var r=null==l?void 0:l.includes(e),n=0===t;return(0,m.jsx)(x,{filterId:e.id,isPrimaryFilter:n,isPlaceholder:b,onFilterClick:c,resetFilterIds:s,toggleFilterId:o,selected:r,index:t,children:e.getName()},e.id)}))]})}))},40407:(e,t,r)=>{r.d(t,{g:()=>M});r(40065),r(43379),r(34192),r(4865);var n=r(30758),i=r(3074),l=r.n(i),a=r(39486),o=r(31285),s=r(7852),c=r(65277),u=r(46669),d=r(10806),f=r(51488),g=r(48),m=(r(7651),r(30456),r(26701),r(25550),r(37417),r(11737),r(51691),r(702),r(5672),r(88856),r(51565),r(15342),r(18316),r(9801)),p=r(73406),y=r(56818),v=r(36178),b=r(46400),h=r(57674),x=r(99),j=r(52856),k=r(48844),S=r(86070),A=function(e){var t=e.onSelect,r=(0,j.a)(),n=r.viewMode,i=r.setViewMode;return(0,S.jsxs)(S.Fragment,{children:[(0,S.jsx)(v.y,{children:x.Ru.get("web-player.your-library-x.sort-and-view-picker.view-as")}),k.i.map((function(e,r){var l=e.value,a=e.icon,o=e.text;return(0,S.jsx)(b.D,{role:"menuitemradio","aria-checked":n===l,divider:r===k.i.length-1?"after":void 0,autoClose:!1,leadingIcon:a(),onClick:function(){i(l),null==t||t(l)},children:o()},l)}))]})},C=["heading","selected","onSelect","options","enableViewModeMenu","onSelectViewMode","sortOrder"];function w(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function O(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?w(Object(r),!0).forEach((function(t){(0,f.A)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):w(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var T=function(e){var t,r=e.heading,n=e.selected,i=e.onSelect,l=e.options,a=e.enableViewModeMenu,o=void 0!==a&&a,s=e.onSelectViewMode,c=e.sortOrder,u=(0,g.A)(e,C);c&&(c===h.H.ASC||c===h.H.SECONDARY_ASC?t=m.U:c!==h.H.DESC&&c!==h.H.SECONDARY_DESC||(t=p.R));return(0,S.jsxs)(y.W,O(O({getInitialFocusElement:function(e){return null==e?void 0:e.querySelector('[aria-checked="true"]')}},u),{},{children:[r?(0,S.jsx)(v.y,{children:r}):null,l.map((function(e,r){var l=e.key,a=e.value;return(0,S.jsx)(b.D,{role:"menuitemradio","aria-checked":l===n.key,CheckedIcon:t,onClick:function(){return i(l,r)},children:a},l)})),o&&(0,S.jsx)(A,{onSelect:s})]}))},I=r(89851),P=r(57965),D=r(35489);const F="x-sortBox-sortDropdown",E="cvTLPmjt6T7M85EKcB8w",R="SbDHY3fVADNJ4l9qOLQ2";var L=function(e){var t=e.isOpen,r=e.className;return t?(0,S.jsx)(a.J,{size:"small","aria-hidden":"true",className:r}):(0,S.jsx)(o.y,{size:"small","aria-hidden":"true",className:r})},M=function(e){var t=e.heading,r=e.options,i=e.selected,a=e.onSelect,o=e.sortOrder,f=e.variant,g=void 0===f?"bodySmall":f,m=e.semanticColor,p=e.disabled,y=e.onClick,v=e.ariaLabel,b=e.enableViewModeMenu,h=void 0!==b&&b,x=(0,c.NC)(D.mA)&&h,j=(0,I.a)().viewMode;i||(i=null==r?void 0:r[0]);var A=k.i.find((function(e){return e.value===j}))||k.i[0],C=(0,n.useMemo)((function(){return"sortboxlist-".concat(l().create().hex)}),[]),w=(0,P.r)(u.d,{}),O=w.spec,M=w.logger;return(0,S.jsx)(d.b,{menu:(0,S.jsx)(T,{selected:i,options:r,onSelect:function(e,t){a(e,t);var r=O.sortBySectionFactory().sortOptionFactory({identifier:e}).hitSort();M.logInteraction(r)},sortOrder:o,heading:t,enableViewModeMenu:x,onSelectViewMode:function(e){var t=O.viewAsSectionFactory().viewOptionFactory({identifier:e}).hitUiElementToggle();M.logInteraction(t)},id:C}),children:function(e,t,r){var n;return(0,S.jsxs)("button",{className:F,onClick:function(e){p||(null==y||y(e),t(e))},ref:r,type:"button","aria-label":v,role:"combobox","aria-controls":C,"aria-expanded":e,children:[(0,S.jsx)(s.E,{"data-sortbox-label":!0,semanticColor:m,variant:g,className:E,children:(null===(n=i)||void 0===n?void 0:n.value)||(x?A.text():"")}),x?A.icon():(0,S.jsx)(L,{isOpen:e,className:R})]})}})}},95539:(e,t,r)=>{r.d(t,{b:()=>O});var n=r(5904),i=r(71523),l=r(64501),a=r.n(l),o=(r(30456),r(79024),r(25550),r(47994),r(43379),r(59255),r(85130),r(55636),r(28509),r(97332),r(46555),r(13296),r(24594),r(97460),r(34192),r(88856),r(15342),r(93577),r(30758)),s=r(99),c=r(32346),u=r(34534),d=r(83635),f=r(49718),g=r(94233),m=r(80086),p=r(87081),y=r(97608),v=r(57674),b=r(22129),h=r(14816),x=r(38672),j=r(68113),k=r(13047),S=r(98424),A=r(86070),C=new Set(f.gc),w=new Set([]),O=o.memo((function(e){var t=e.nrTracks,r=e.collectionUri,l=e.initialItems,O=e.uri,T=e.sortable,I=void 0===T||T,P=e.scrollToUri,D=e.usePlayContextItem,F=e.outerDomRef,E=e.spec,R=e.isCompactMode,L=void 0!==R&&R,M=e.tagFilter,N=(0,x.f)(),_=(0,o.useRef)(null),U=(0,o.useContext)(d.g).filter,B=(0,o.useRef)((function(){})),V=(0,o.useState)([]),$=(0,i.A)(V,2),H=$[0],z=$[1],K=(0,o.useContext)(f.cL),q=K.sortState,X=K.setSortState,Q=(0,j.s)(),W=(0,g.w)(),Y=(0,o.useCallback)((function(e,t){e===v.$.ADDED_AT?X({column:v.$.ADDED_AT,order:q.order===v.H.ASC?v.H.DESC:v.H.ASC}):X((0,c.So)(e,q)),E&&Q.logInteraction(E.columnHeaderFactory({identifier:e,position:t||0}).hitSort())}),[Q,X,q,E]);(0,o.useEffect)((function(){_.current&&P&&_.current.scrollToItem({uri:P})}),[P]);var Z=(0,o.useCallback)((function(e){var t=e.map((function(e){return e.uri}));B.current(),N.remove({uris:t})}),[N]),J=(0,o.useCallback)((function(e,t){B.current=t,e.length>1?z(e):Z(e)}),[Z]),G=(0,m.z1)(),ee=(0,i.A)(G,2)[1],te=(0,o.useCallback)(function(){var e=(0,n.A)(a().mark((function e(t,r){var n,i,l,o,s;return a().wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,N.getTracks({offset:t,limit:r,uri:O,sort:(0,b.c)(q),filters:[null!=U?U:null,null!=M?M:null].filter(k.P)});case 2:return l=e.sent,o=null!==(n=null==l?void 0:l.totalLength)&&void 0!==n?n:0,s=null!==(i=null==l?void 0:l.items)&&void 0!==i?i:[],e.abrupt("return",{items:s,totalLength:o});case 6:case"end":return e.stop()}}),e)})));return function(t,r){return e.apply(this,arguments)}}(),[U,M,N,q,O]),re=(0,o.useCallback)((function(e,t){var n,i=(0,S.g)(null===(n=e.album)||void 0===n?void 0:n.images,{desiredSize:40,desiredLabel:"small"});return(0,A.jsx)(p.W,{index:t,contextUri:r,uri:e.uri,isPlayable:e.isPlayable,duration_ms:e.duration.milliseconds,name:e.name,artists:e.artists,albumOrShow:e.album,isExplicit:e.isExplicit,isMixedMedia:!1,isPaywalled:!1,isUserSubscribed:!1,isLocal:e.isLocal,addedBy:[],dateAdded:e.addedAt,hasDecoratedAddedBy:!1,release_date:"",isMOGEFRestricted:e.is19PlusOnly,type:e.type,imgUrl:(null==i?void 0:i.url)||"",onMove:function(){},onInsert:function(){},usePlayContextItem:D,allowedDropTypes:[],isDisliked:!1,playlistName:s.Ru.get("sidebar.liked_songs"),isOwnedBySelf:!0,isCompactMode:L,hasAssociatedVideo:e.hasAssociatedVideo},t+e.uri)}),[r,D,L]),ne=(0,o.useCallback)((function(e){return{uri:e.uri,uid:e.uri}}),[]);return(0,A.jsxs)(A.Fragment,{children:[(0,A.jsx)(h.pZ,{value:"liked-songs-tracklist",children:(0,A.jsx)(y.S4,{ariaLabel:s.Ru.get("sidebar.liked_songs"),hasHeaderRow:!0,columns:W,sortableColumns:N.getCapabilities().canSortTracksAndEpisodes&&I?C:w,sortState:q,onSort:Y,renderRow:re,resolveItem:ne,onRemove:J,nrTracks:t,fetchTracks:te,limit:50,canFetchAllTracks:N.getCapabilities().canFetchAllItems,outerRef:_,outerDomRef:F,tracks:l,onNrValidItemsChange:ee,isCompactMode:L,columnPersistenceKey:"liked-songs-tracklist"},r)}),(0,A.jsx)(u.F,{title:s.Ru.get("remove_from_your_liked_songs"),isOpen:H.length>0,tracks:H,onClose:function(e){e.stopPropagation(),z([])},onRemove:Z})]})}))},22129:(e,t,r)=>{r.d(t,{c:()=>s});var n=r(51488),i=r(32346),l=r(63501),a=r(9179),o=(0,n.A)((0,n.A)((0,n.A)((0,n.A)((0,n.A)((0,n.A)((0,n.A)((0,n.A)({},a.nw.ADDED_AT,l.Sw.ADDED_AT),a.nw.ADDED_BY,null),a.nw.ALBUM,l.Sw.ALBUM_NAME),a.nw.ARTIST,l.Sw.ARTIST_NAME),a.nw.DURATION,null),a.nw.TITLE,l.Sw.NAME),a.nw.SHOW_NAME,null),a.nw.PUBLISH_DATE,null),s=function(e){var t=(0,i.Xt)(e);if(t){var r=o[t.field],n=t.order;if(r&&n)return{field:r,order:n}}}},3360:(e,t,r)=>{r.r(t),r.d(t,{default:()=>Qe});var n=r(51488),i=r(71523),l=(r(7651),r(83234),r(30456),r(26701),r(53276),r(79024),r(40122),r(47994),r(37417),r(11737),r(51691),r(702),r(5672),r(43379),r(2823),r(97460),r(29426),r(34192),r(88856),r(51565),r(18316),r(93577),r(54520),r(91531),r(93678),r(34145),r(30758)),a=r(94822),o=r(90543),s=r(31740),c=r(65277),u=r(46067),d=r(2860),f=r(99),g=r(17781),m=r(72705),p=r(96974),y=r(83635),v=r(49718),b=r(80086),h=r(30162),x=r(57674),j=r(17636),k=r(1958),S=r(23060),A=r(81220),C=r(40637),w=r(40407),O=(r(78551),r(25550),r(82467),r(15342),r(91252)),T=r(90785),I=r(58999),P=r(94233),D=r(57965),F=r(34319),E=r(86070),R=l.memo((function(e){var t=e.tracklistDomRef,r=(0,D.r)(O.E,{}),n=r.spec,i=r.logger,a=(0,l.useCallback)((function(){i.logInteraction(n.filterFieldFactory().keyStrokeFilter())}),[i,n]),o=(0,l.useCallback)((function(){i.logInteraction(n.filterFieldFactory().hitClearFilter())}),[i,n]),s=(0,P.w)().filter((function(e){var t=e.columnType;return v.gc.includes(t)})).map((function(e){return e.columnType}));return(0,E.jsxs)("div",{className:F.A.searchBoxContainer,children:[(0,E.jsx)(l.Suspense,{fallback:null,children:(0,E.jsx)(T.S,{placeholder:f.Ru.get("playlist.search_in_playlist"),clearOnEscapeInElementRef:t,onFilter:a,onClear:o})}),(0,E.jsx)(I.d,{columns:s})]})})),L=(r(40065),r(4865),r(97500)),M=r.n(L),N=r(86287),_=r(88610),U=r(44671),B=r(66606),V=r(49093),$=r(63656),H=r(38672),z=r(36144),K=r(73413),q="liked-songs-tags";function X(){var e=(0,c.NC)(V.cLA),t=(0,K.x)("liked-songs-current-tag-filter",null),r=(0,i.A)(t,2),n=r[0];return[e?n:null,r[1]]}var Q=r(68113);const W="q_yjkS1y6URH4Xm7gZfw";var Y=function(e){return{id:e.filter,getName:function(){return e.name},ubiId:e.name}},Z=(0,l.memo)((function(e){var t=e.spec,r=function(e){var t=e.nrTracks,r=(0,H.f)(),n=(0,_.jE)(),a=X(),o=(0,i.A)(a,2),s=o[0],c=o[1],u=(0,l.useState)([]),d=(0,i.A)(u,2),f=d[0],g=d[1],m=(0,U.I)({queryKey:[q],queryFn:function(){return null==r?void 0:r.getTracksFilterTags()},staleTime:0,gcTime:864e5,placeholderData:B.rX,refetchOnWindowFocus:!1}).data;(0,l.useLayoutEffect)((function(){if(!(null==m?void 0:m.find((function(e){return e.filter===s})))&&s){if(t>0&&null!=m&&m.length)return;c(null)}g(null!=m?m:[])}),[s,c,t,m]);var p=(0,l.useCallback)((function(e){e.data.list===$.Ir.TRACKS&&n.invalidateQueries({queryKey:[q]})}),[n]);(0,z.l)($.UV.UPDATE,p);var y=(0,l.useMemo)((function(){return f.find((function(e){return e.filter===s}))}),[s,f]),v=(0,l.useCallback)((function(e){var t;c(null!==(t=null==e?void 0:e.filter)&&void 0!==t?t:null)}),[c]);return{tags:s||t?f:[],currentTag:y,setCurrentTag:v}}({nrTracks:e.nrTracks}),n=r.tags,a=r.currentTag,o=r.setCurrentTag,s=(0,Q.s)(),c=(0,l.useCallback)((function(e,r,i){var l;if(!e)return l=t.clearButtonFactory().hitClearFilter(),void s.logInteraction(l);var a=n.find((function(t){return t.filter===e}));if(a){var c=t.filterChipFactory({identifier:a.name,position:i});r?(l=c.hitClearFilter(),o(null)):(l=c.hitFilter(),a&&o(a)),s.logInteraction(l)}}),[s,o,t,n]),u=a?[]:n.map(Y),d=a?[Y(a)]:[];return n.length?(0,E.jsx)(k.S,{children:(0,E.jsx)(N.s,{availableFilters:u,selectedFilters:d,toggleFilterId:function(){},resetFilterIds:function(){return o(null)},onFilterClick:c,ariaLabel:f.Ru.get("web-player.liked-songs.liked-songs-filter-tags"),clearBtnAriaLabel:f.Ru.get("web-player.liked-songs.clear-filter"),className:M()(W),applyLightThemeControls:!0})}):null})),J=r(62033),G=r(89),ee=r(54477),te=r(22424),re=r(30683),ne=r(9179),ie=r(84959),le=r(35489);const ae="ivuDaTbfBpBewwr39aDQ";var oe=l.memo((function(e){var t=e.metadata,r=e.onClickTogglePlay,n=e.isPlaying,i=e.spec,a=e.logger,o=e.backgroundColor,s=e.canSort,u=e.canFilter,d=t.uri,g=t.name,m=t.totalLength,p=(0,l.useRef)(null),y=(0,l.useMemo)((function(){return i.actionBarFactory()}),[i]),v=(0,l.useMemo)((function(){return y.shuffleButtonContainerFactory()}),[y]),b=(0,l.useMemo)((function(){return y.filtersFactory()}),[y]),h=m>0,x=m>0,O=s&&u,T=(0,ee.X)(),I=(0,l.useCallback)((function(e,t){var r=y.downloadButtonFactory();t===re.NV.ADD?a.logInteraction(r.hitDownload({itemToDownload:d})):t===re.NV.REMOVE?a.logInteraction(r.hitRemoveDownload({itemToRemoveFromDownloads:d})):t===re.NV.NO_PERMISSION&&a.logInteraction(r.hitUiReveal())}),[y,a,d]),P=(0,te.j)(),D=(0,c.NC)(V.cLA);return(0,E.jsxs)(j.E,{backgroundColor:o,children:[(0,E.jsxs)(k.S,{children:[x?(0,E.jsx)(C.D,{onClick:r,isPlaying:n,size:P,uri:d,ariaPauseLabel:f.Ru.get("playlist.a11y.pause",g),ariaPlayLabel:f.Ru.get("playlist.a11y.play",g)}):null,T&&(0,E.jsx)(ie.r,{spec:v,children:(0,E.jsx)(G.Y,{entityName:g,contextUri:d,activationPlacement:"bottomEnd",size:P})}),(0,E.jsx)(S.f,{uri:d,canDownload:h,isFollowing:!0,onFollow:function(){},size:P,onClick:I,condensed:!0}),O?(0,E.jsx)(ie.r,{spec:y,children:(0,E.jsx)(A.u,{property:V.IZ_,renderNewExperience:function(){return(0,E.jsx)("div",{className:ae,children:(0,E.jsx)(J.d,{sortOptions:[ne.nw.TITLE,ne.nw.ADDED_AT,ne.nw.ARTIST,ne.nw.ALBUM,ne.nw.DURATION],defaultSortField:ne.nw.ADDED_AT,filterPlaceholder:f.Ru.get("playlist.search_in_playlist"),enableViewModeMenu:!0})})},renderOldExperience:function(){return(0,E.jsx)(R,{tracklistDomRef:p})}})}):(0,E.jsx)("div",{className:ae,children:(0,E.jsx)(A.u,{property:le.mA,renderNewExperience:function(){return(0,E.jsx)(w.g,{options:[],onSelect:function(){},selected:null,enableViewModeMenu:!0})}})})]}),D&&(0,E.jsx)(Z,{spec:b,nrTracks:m})]})})),se=r(22129),ce=r(87081),ue=(r(59255),r(85130),r(55636),r(28509),r(97332),r(46555),r(13296),r(24594),r(97608)),de=r(32634),fe=r(40508),ge=r(66114),me=r(72763),pe=r(89851),ye=r(4178),ve=function(e){var t=e.ariaLabel,r=e.columns,n=e.columnPersistenceKey,i=e.renderItem,a=e.defaultSortField,s=(0,me.g)().playlist,c=(0,ye.m)().getCapabilities().canFetchAllTracks,u=(0,ge.K_)(),d=(0,l.useRef)(null),f=(0,pe.a)().isCompactMode,g="custom-order"===a;!function(e){var t=(0,o.wQ)(),r=(0,o.zy)(),n="POP"!==t?new URLSearchParams(r.search).get("uid"):null;(0,l.useLayoutEffect)((function(){e.current&&n&&e.current.scrollToItem({uid:n})}),[n,e])}(d);var m=function(e,t){var r=(0,de.kW)(),n=r.sortState,i=r.setSortState,a=(0,l.useMemo)((function(){return(0,fe.Ap)(e,n)}),[e,n]),o=(0,l.useCallback)((function(e){i((0,fe.hK)(e,a,t))}),[t,i,a]);return{trackListSortState:a,onSort:o}}(r,g),p=m.trackListSortState,y=m.onSort,v=(0,l.useCallback)((function(e){return{uri:e.uri,uid:e.uid,type:e.type}}),[]),b=(0,l.useMemo)((function(){return new Set((0,fe.g6)(r))}),[r]);return(0,E.jsx)(h.a,{columns:r,children:(0,E.jsx)(ue.g0,{ariaLabel:t,hasHeaderRow:!0,columns:r,sortableColumns:b,sortState:p,onSort:y,renderRow:i,resolveItem:v,itemsCache:u,canFetchAllTracks:c,isCompactMode:f,columnPersistenceKey:n,outerRef:d},s.metadata.uri+f)})},be=r(14816),he=r(28695),xe=r(98424),je=[x.$.INDEX,x.$.TITLE_AND_ARTIST,x.$.ALBUM,x.$.ADDED_AT,x.$.DURATION],ke=l.memo((function(e){var t=e.usePlayContextItem,r=(0,pe.a)().isCompactMode,n=function(e){var t=e.isCompactMode,r=void 0!==t&&t,n=[].concat(je);return r&&n.splice(n.indexOf(x.$.TITLE_AND_ARTIST),1,x.$.TITLE,x.$.ARTIST),n}({isCompactMode:r}),i=(0,me.g)().playlist.metadata,a=(0,l.useCallback)((function(e,n){var l;if(!(0,he.Jy)(e))return(0,E.jsx)(E.Fragment,{});var a=(0,xe.g)(null===(l=e.album)||void 0===l?void 0:l.images,{desiredSize:40,desiredLabel:"small"});return(0,E.jsx)(ce.W,{index:n,contextUri:i.uri,uri:e.uri,isPlayable:e.isPlayable,duration_ms:e.duration.milliseconds,name:e.name,artists:e.artists,albumOrShow:e.album,isExplicit:e.isExplicit,isMixedMedia:!1,isPaywalled:!1,isUserSubscribed:!1,isLocal:e.isLocal,addedBy:[],dateAdded:e.addedAt,hasDecoratedAddedBy:!1,release_date:"",isMOGEFRestricted:e.is19PlusOnly,type:e.type,imgUrl:(null==a?void 0:a.url)||"",onMove:function(){},onInsert:function(){},usePlayContextItem:t,allowedDropTypes:[],isDisliked:!1,playlistName:f.Ru.get("sidebar.liked_songs"),isOwnedBySelf:!0,isCompactMode:r,hasAssociatedVideo:e.hasAssociatedVideo},n+e.uri)}),[i.uri,t,r]);return(0,E.jsx)(be.pZ,{value:"liked-songs-tracklist",children:(0,E.jsx)(ve,{ariaLabel:f.Ru.get("sidebar.liked_songs"),columns:n,renderItem:a,columnPersistenceKey:"liked-songs-tracklist",defaultSortField:ne.nw.ADDED_AT})})})),Se=r(81350),Ae=r(41987),Ce=r(58237),we=r(74484),Oe=r(21986);function Te(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function Ie(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?Te(Object(r),!0).forEach((function(t){(0,n.A)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):Te(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Pe=function(){var e=(0,me.g)(),t=e.playlist.metadata,r=e.contentsOptions,n=(0,ye.m)().getCapabilities(),a=n.canSort,o=n.canFilter,c=t.uri,d=t.name,p=t.totalLength,y=(0,Ae.z)("#5038a0"),v=(0,D.r)(u.k,{data:{uri:c}}),h=v.spec,x=v.logger,j=l.useMemo((function(){return h.headerFactory()}),[h]),k=l.useMemo((function(){return h.tracklistFactory()}),[h]),S=(0,we.P)((0,Oe.A)(t.uri,r),{featureIdentifier:"your_library",referrerIdentifier:"your_library"}),A=S.isPlaying,C=S.togglePlay,w=S.usePlayContextItem,O=S.isActive,T=function(){var e=(0,Ce.$I)({isPlaying:A,isActive:O,spec:h.actionBarFactory().playButtonFactory(),logger:x,uri:c});C({loggingParams:e})},I=(0,b.z1)(),P=(0,i.A)(I,1)[0];return(0,E.jsxs)("section",{role:"presentation",className:F.A.playlist,"data-testid":"playlist-page",children:[(0,E.jsx)(g.Q,{children:f.Ru.get("playlist.page-title",d)}),(0,E.jsx)(Se.x,{metadata:Ie(Ie({},t),{},{hasSpotifyTracks:!0}),totalItems:P,isPlaying:A,togglePlay:T,backgroundColor:y,specLikedSongs:j}),(0,E.jsx)(oe,{metadata:t,onClickTogglePlay:T,isPlaying:A,spec:h,logger:x,backgroundColor:y,canSort:a,canFilter:o}),(0,E.jsx)("div",{className:"contentSpacing",children:p>0?(0,E.jsx)(ie.r,{spec:k,children:(0,E.jsx)(ke,{usePlayContextItem:w})}):(0,E.jsx)(m.p,{message:f.Ru.get("collection.empty-page.songs-subtitle"),title:f.Ru.get("collection.empty-page.songs-title"),linkTo:"/search",linkTitle:f.Ru.get("collection.empty-page.songs-cta"),renderInline:!0,children:(0,E.jsx)(s.v,{"aria-hidden":"true"})})})]})},De=r(95539),Fe=r(88308),Ee=r(3497),Re=r(95657);var Le=r(96714),Me=r(73309),Ne=r(74156),_e=r(14562),Ue=r(9700),Be=r(69307),Ve=r(13047);function $e(e,t,r){var n={uri:e};return(0,_e.qq)(n,t),(0,Ue.Pz)(n,null==r?void 0:r.map((function(e){var t;return null!==(t=(0,Be.HI)(e))&&void 0!==t?t:null})).filter(Ve.P)),n}function He(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function ze(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?He(Object(r),!0).forEach((function(t){(0,n.A)(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):He(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}var Ke=[x.$.INDEX,x.$.TITLE_AND_ARTIST,x.$.ALBUM,x.$.ADDED_AT,x.$.DURATION],qe=function(e){var t=e.data,r=e.canFilter,n=e.canSort,a=t.metadata,c=a.uri,d=a.name,j=a.totalLength,k=(0,l.useRef)(null),S=(0,Ae.z)("#5038a0"),A=X(),C=(0,i.A)(A,1)[0],w=(0,l.useContext)(y.g).filter,O=(0,l.useContext)(v.cL),T=O.sortState,I=O.setSortState,P=(0,D.r)(u.k,{data:{uri:c}}),R=P.spec,L=P.logger,M=l.useMemo((function(){return R.headerFactory()}),[R]),N=l.useMemo((function(){return R.tracklistFactory()}),[R]);(0,l.useEffect)((function(){null===T.column&&I({column:x.$.ADDED_AT,order:x.H.DESC})}),[T,I]);var _=(0,o.wQ)(),U=(0,o.zy)(),B="POP"!==_?new URLSearchParams(U.search).get("uri"):null,V=(0,we.P)($e(c,(0,se.c)(T),[w,C].filter(Ve.P)),{featureIdentifier:"your_library",referrerIdentifier:"your_library"}),$=V.isPlaying,H=V.togglePlay,z=V.usePlayContextItem,K=V.isActive,q=function(){var e=(0,Ce.$I)({isPlaying:$,isActive:K,spec:R.actionBarFactory().playButtonFactory(),logger:L,uri:c});H({loggingParams:e})},Q=(0,b.z1)(),W=(0,i.A)(Q,1)[0],Y=(0,pe.a)().isCompactMode,Z=function(e){var t=e.isCompactMode,r=void 0!==t&&t,n=[].concat(Ke);return r&&n.splice(n.indexOf(x.$.TITLE_AND_ARTIST),1,x.$.TITLE,x.$.ARTIST),n}({isCompactMode:Y});return(0,E.jsx)(h.a,{columns:Z,children:(0,E.jsxs)("section",{role:"presentation",className:F.A.playlist,"data-testid":"playlist-page",children:[(0,E.jsx)(g.Q,{children:f.Ru.get("playlist.page-title",d)}),(0,E.jsx)(Se.x,{metadata:ze(ze({},t.metadata),{},{hasSpotifyTracks:!0}),totalItems:W,isPlaying:$,togglePlay:q,backgroundColor:S,specLikedSongs:M}),(0,E.jsx)(oe,{metadata:t.metadata,onClickTogglePlay:q,isPlaying:$,spec:R,logger:L,backgroundColor:S,canSort:n,canFilter:r}),(0,E.jsx)("div",{className:"contentSpacing",children:j>0?(0,E.jsx)(l.Suspense,{fallback:(0,E.jsx)(p.LoadingPage,{hasError:!1,errorMessage:f.Ru.get("error.request-collection-tracks-failure")}),children:(0,E.jsx)(ie.r,{spec:N,children:(0,E.jsx)(De.b,{nrTracks:j,collectionUri:c,scrollToUri:B,usePlayContextItem:z,outerDomRef:k,spec:N,initialItems:t.contents.items,isCompactMode:Y,tagFilter:C})})}):(0,E.jsx)(m.p,{message:f.Ru.get("collection.empty-page.songs-subtitle"),title:f.Ru.get("collection.empty-page.songs-title"),linkTo:"/search",linkTitle:f.Ru.get("collection.empty-page.songs-cta"),renderInline:!0,children:(0,E.jsx)(s.v,{"aria-hidden":"true"})})})]})})},Xe=l.memo((function(e){var t=e.user,r=e.uri,n=(0,l.useContext)(y.g).filter,a=(0,l.useContext)(v.cL).sortState,o=X(),s=(0,i.A)(o,1)[0],c=function(e,t,r){var n=(0,H.f)(),i=(0,_.jE)(),a=(0,Fe.U0)((function(){return["useLikedSongs",e,r]}),[e,r]),o=(0,U.I)({queryKey:a(),queryFn:function(){return n.getTracks(r)},gcTime:18e5,placeholderData:B.rX,refetchOnWindowFocus:!1}).data,s=(0,l.useCallback)((function(){i.invalidateQueries({queryKey:a()})}),[i,a]);(0,z.l)($.UV.UPDATE,s);var c=(0,Ee.$R)(t.id);return c&&o?{metadata:{uri:e,name:c.name,images:c.images,totalLength:null==o?void 0:o.totalLength,unfilteredTotalLength:o.unfilteredTotalLength,owner:(0,Re.w)(t)},contents:o}:null}(r,t,{offset:0,limit:25,sort:(0,se.c)(a),filters:[n,s].filter(Ve.P)}),u=(0,H.f)().getCapabilities();return c?(0,E.jsx)(qe,{data:c,canFilter:u.canFilterTracksAndEpisodes&&c.metadata.unfilteredTotalLength>0,canSort:u.canSortTracksAndEpisodes&&c.metadata.unfilteredTotalLength>0}):(0,E.jsx)(p.LoadingPage,{hasError:!1,errorMessage:f.Ru.get("error.not_found.title.playlist"),loadOffline:u.canModifyOffline})}));const Qe=function(){var e=(0,a.d4)(Me.Ht).user;if((0,c.NC)(V.IZ_,{loadingValue:!1}))return(0,E.jsx)(Le.W,{uri:Ne.DK,children:(0,E.jsx)(Pe,{})});if(null===e)return null;var t=(0,d.fHB)(e.id).toURI();return(0,E.jsx)(v.sn,{uri:t,children:(0,E.jsx)(y.s,{uri:t,children:(0,E.jsx)(b.S1,{children:(0,E.jsx)(Xe,{uri:t,user:e})})})})}}}]);
//# sourceMappingURL=xpui-routes-collection-songs.js.map