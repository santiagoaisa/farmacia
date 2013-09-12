<%@ taglib uri="http://www.zkoss.org/dsp/web/core" prefix="c" %>
<%@ taglib uri="http://www.zkoss.org/dsp/zk/core" prefix="z" %>
<%@ taglib uri="http://www.zkoss.org/dsp/web/theme" prefix="t" %>
.sidebar>ul{margin:10px 0 0;width:220px}
.sidebar>ul .z-navitem-selected{position:relative}
.sidebar>ul .z-navitem-selected>.z-navitem-content{${t:boxShadow('0 2px 4px rgba(0, 0, 0, 0.2) inset') }}
.sidebar>ul .z-navitem-selected:after{
    font-family:FontAwesome;font-weight:bold;
    font-style:normal;
    color:#FF0000;
    text-decoration:inherit;
    -webkit-font-smoothing:antialiased;
    *margin-right:.3em;
    content:"\f0d9";
    font-size:28px;
    color:#eee;
    display:inline-block;
    position:absolute;
    right:-1px;
    top:12px;
    z-index:35px}
.sidebar>ul .z-nav-selected>.z-nav-content:before{display:none}
.sidebar>ul ul{${t:boxShadow('0 0 3px rgba(0, 0, 0, 0.5) inset') }}
.sidebar>ul ul .z-nav-content,.sidebar>ul ul .z-navitem-content{background:transparent;padding-left:25px}
.sidebar>ul .z-nav-content,.sidebar>ul 
.z-navitem-content{
    padding:10px 0 10px 15px;
    display:block;
    background:transparent;
    height:42px;
    color:#aaa;
    border:0}
.sidebar>ul .z-nav-content i,.sidebar>ul .z-navitem-content i{
    margin-right:10px;
    opacity:.5}
.sidebar .z-nav-info{
    background:#333;
    margin:0 20px 0 0;
    float:right;
    height:auto;
    width:auto;
    line-height:normal;
    padding:3px 5px 2px;
    box-shadow:0 1px 2px rgba(0,0,0,0.5) inset,0 1px 0 rgba(255,255,255,0.2)}
.sidebar .z-navitem-image{display:none}<c:if test="${zk.ie < 9}">.z-navitem-selected{z-index:30}.z-navitem-selected>a{z-index:-9}.z-navitem-selected>a .z-navitem-text{position:relative}</c:if>
