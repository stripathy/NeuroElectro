var _____WB$wombat$assign$function_____ = function(name) {return (self._wb_wombat && self._wb_wombat.local_init && self._wb_wombat.local_init(name)) || self[name]; };
if (!self.__WB_pmw) { self.__WB_pmw = function(obj) { this.__WB_source = obj; return this; } }
{
  let window = _____WB$wombat$assign$function_____("window");
  let self = _____WB$wombat$assign$function_____("self");
  let document = _____WB$wombat$assign$function_____("document");
  let location = _____WB$wombat$assign$function_____("location");
  let top = _____WB$wombat$assign$function_____("top");
  let parent = _____WB$wombat$assign$function_____("parent");
  let frames = _____WB$wombat$assign$function_____("frames");
  let opener = _____WB$wombat$assign$function_____("opener");


// JavaScript functions to show and hide drop-down menus.
// In SimpleNavBar.html we call ShowMenuDiv each time the mouse goes over 
// either the menu title or the submenu itself, and call HideMenuDiv when the
// mouse goes out of the menu title or the submenu iteslf (onMouseOut).

function ShowItem (itemID) {
  var x = document.getElementById(itemID);
  if (x)
    x.style.visibility = "visible";
  return true;
}

function HideItem (itemID) { 
  var x = document.getElementById(itemID);
  if (x)
     x.style.visibility = "hidden";
  return true;
}

//    As noted in the SimpleNavBarStyles.css file, using x.style.visibility as
//    seen below seemed to have better cross browser support than using 
//    x.style.display="block" and x.style.display="none" to show and hide 
//    the menu.


}
/*
     FILE ARCHIVED ON 08:00:41 Dec 14, 2021 AND RETRIEVED FROM THE
     INTERNET ARCHIVE ON 05:00:07 Jan 13, 2025.
     JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.

     ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
     SECTION 108(a)(3)).
*/
/*
playback timings (ms):
  captures_list: 0.557
  exclusion.robots: 0.019
  exclusion.robots.policy: 0.008
  esindex: 0.013
  cdx.remote: 10.437
  LoadShardBlock: 462.261 (3)
  PetaboxLoader3.resolve: 224.467 (3)
  PetaboxLoader3.datanode: 85.666 (4)
  load_resource: 52.977
*/