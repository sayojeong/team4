/*
@license

dhtmlxScheduler v.5.2.3 Professional Evaluation
This software is covered by DHTMLX Evaluation License. Contact sales@dhtmlx.com to get Commercial or Enterprise license. Usage without proper license is prohibited.

(c) XB Software Ltd.

*/
Scheduler.plugin(function(e){!function(){function t(e){var t=function(){};return t.prototype=e,t}var a=e._load;e._load=function(e,i){if("object"==typeof(e=e||this._load_url))for(var n=t(this._loaded),r=0;r<e.length;r++)this._loaded=new n,a.call(this,e[r],i);else a.apply(this,arguments)}}()});