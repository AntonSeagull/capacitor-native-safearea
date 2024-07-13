#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

CAP_PLUGIN(CapSafeAreaPlugin, "CapSafeArea",

           CAP_PLUGIN_METHOD(showTopSafeArea, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(showBottomSafeArea, CAPPluginReturnPromise);
             
)
