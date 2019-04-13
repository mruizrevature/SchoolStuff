public class CalloutApexClass {
	@AuraEnabled
    public static List<Map<String,Object>> getConditions(Integer age, String sex, List<String> symptoms) {
        
        List<Map<String,Object>> possibleConditions = new List<Map<String,Object>>();
        
        // API requires that sex must be 'male' or 'female'
        String querySex = (sex == 'other') ? 'female' : sex;        
        // API requires that age must be a positive integer between 0 and 130
        Integer queryAge = (0 < age && age < 130) ? age : 20;
        
        // Create the request
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        // Set the endpoint
        request.setEndpoint('https://api.infermedica.com/v2/diagnosis');
        // Set HTTP Request Type
        request.setMethod('POST');
        
        // Get App Id
        StaticResource appIdSR = [SELECT Body
                                  FROM StaticResource
                                  WHERE Name='InfermedicaAppId'
                                  LIMIT 1];
        String appId = appIdSR.Body.toString();
        
        // Get App Key
        StaticResource appKeySR = [SELECT Body
                                  FROM StaticResource
                                  WHERE Name='InfermedicaAppKey'
                                  LIMIT 1];
        String appKey = appKeySR.Body.toString();
        
        // Set additional headers
        request.setHeader('App-Id', appId);
        request.setHeader('App-Key', appKey);
        request.setHeader('Content-Type', 'application/json');
        
        // Set the body
        Map<String, Object> body = new Map<String, Object>();
        List<Map<String, Object>> evidence = new List<Map<String, Object>>();
        
        for (String symptomId : symptoms) {
            Map<String, Object> symptomObj  = new Map<String, Object>();
            symptomObj.put('choice_id', 'present');
            symptomObj.put('id', symptomId);
            evidence.add(symptomObj);
        }
        
        body.put('evidence', evidence);
        body.put('age', queryAge);
        body.put('sex', querySex);
        
        System.debug('body: ' + body);
		String bodyJSON = JSON.serialize(body);
        System.debug('bodyJSON: ' + bodyJSON);
        
        request.setBody(bodyJSON);
        System.debug('request: ' + request);
        
        HttpResponse response = http.send(request);
        System.debug('response: ' + response);
        
        if (response.getStatusCode() == 200) {
            System.debug('responseBody: ' + response.getBody());
            
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        	System.debug('results: ' + results);
            List<Object> conditions = (List<Object>)results.get('conditions');
            System.debug('conditions: ' + conditions);
            
            for (Object cond : conditions) {
                Map<String, Object> conditionInfo = new Map<String,Object>();
                Map<String, Object> condMap = (Map<String, Object>)cond;
                conditionInfo.put('Name', (String)condMap.get('name'));
                conditionInfo.put('Probability', (Double)condMap.get('probability'));
            
				System.debug('conditionInfo: ' + conditionInfo);
                possibleConditions.add(conditionInfo);
            }
        }
        
        System.debug('possibleConditions: ' + possibleConditions);
        return possibleConditions;
    }
}