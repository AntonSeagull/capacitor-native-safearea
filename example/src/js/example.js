import { CapSafeArea } from 'capacitor-native-safearea';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    CapSafeArea.echo({ value: inputValue })
}
