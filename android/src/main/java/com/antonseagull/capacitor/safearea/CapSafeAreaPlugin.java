package com.antonseagull.capacitor.safearea;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "CapSafeArea")
public class CapSafeAreaPlugin extends Plugin {

    private CapSafeArea implementation = new CapSafeArea();

    @PluginMethod
    public void showTopSafeArea(PluginCall call) {
        String color = call.getString("color", "#FFFFFF");

       

        call.resolve();
    }

    @PluginMethod
    public void showBottomSafeArea(PluginCall call) {
        String color = call.getString("color", "#FFFFFF");

        call.resolve();
    }
}
