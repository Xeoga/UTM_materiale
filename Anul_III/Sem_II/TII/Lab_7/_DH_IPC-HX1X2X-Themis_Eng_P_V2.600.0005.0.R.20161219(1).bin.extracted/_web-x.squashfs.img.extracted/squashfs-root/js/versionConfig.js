!function(a){define(function(require,a,b){b.exports=require("jsCore/pageTab")}),define("version",function(require,b,c){var d,e,f=require("jsCore/rpc"),g=require("jsCore/ability"),h=require("jsCore/pageBase");c.exports=h.extend({init:function(){var a=this;e=f.MagicBox.getSubModules(),d=f.IntervideoManager.getVersion("Onvif"),a.render()},render:function(){var b=this;g.get("DeviceType").done(function(a){isEnable("show_Device_type")&&b.$("#v_devicetype").text(a).parent().show()}),g.get("SerialNo").done(function(a){b.$("#v_serialnumber").text(a)}),d.done(function(a){a&&a.Onvif&&b.$("#v_onvifversion").text(a.Onvif).parent().show()}),a.when(g.get("MajorVersion"),g.get("MinorVersion"),g.get("VendorAbbr"),g.get("OEMVersion"),g.get("Revision"),g.get("TypeVersion"),g.get("BuildDate"),g.get("WebVersion")).done(function(){var c="",d=arguments;null!==d[0]&&(c+=d[0]),null!==d[1]&&(c+="."+a.pad(d[1],3)),null!==d[2]&&(c+="."+a.pad(d[2],2)),null!==d[3]&&(c+=a.pad(d[3],2)),null!==d[4]&&(c+="."+d[4]),null!==d[5]&&(c+="."+d[5]),null!==d[6]&&(c+=", Build Date: "+d[6]),b.$("#v_softversion").text(c),null!=d[7]&&b.$("#v_webedition").text(d[7])}),e.done(function(c){a.each(c,function(a,c){var d=c.SoftwareVersion;switch(c.ModuleName){case"PTZ":"Unknow"!==d&&""!==d&&b.$("#v_ptzversion").text(d).parent().show();break;case"Camera":"Unknow"!==d&&""!==d&&"FF.FF.FF"!==d&&b.$("#v_cameraversion").text(d).parent().show()}})})}})})}(jQuery);