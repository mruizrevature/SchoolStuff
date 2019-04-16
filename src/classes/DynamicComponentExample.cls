public class DynamicComponentExample {
    public DynamicComponentExample(ApexPages.StandardController ctrl) {}
    
    // Component.Component_namespace.Component_name
    public Component.Apex.OutputText getHeaderWithDueDateCheck() {
        Component.Apex.OutputText outputText = new Component.Apex.OutputText();
        outputText.value = 'Look at me';
        return outputText;
    }
}