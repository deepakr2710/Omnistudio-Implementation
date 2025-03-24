global with sharing class GetContactIdCaseNumClass implements Callable {
    public Object call(String action, Map<String, Object> args) {
        Map<String, Object> input = (Map<String, Object>) args.get('input');
        Map<String, Object> output = (Map<String, Object>) args.get('output');
        Map<String, Object> options = (Map<String, Object>) args.get('options');
        return invokeMethod (action, input, output, options);  
    }
    private Object invokeMethod(String methodName, Map<String, Object> inputMap, Map<String, Object> outMap,Map < String, Object > options)
    {
        if(methodName == 'getContactid')
        {
            String idOfGetCon = (String)inputMap.get('IdOfGetContact');
            String idOfCreatedCon = (String)inputMap.get('IdOfCreatedContact');
            //System.debug('idOfGetCon >>> '+ idOfGetCon);
            //System.debug('idOfCreatedCon >>> '+ idOfCreatedCon);
            String idOfContact = '';
            
            if(idOfGetCon != null)
            {
                idOfContact = idOfGetCon;
            }
            if(idOfCreatedCon != null)
            {
                idOfContact = idOfCreatedCon;
            }
            
            outMap.put('result',idOfContact);
            System.debug(outMap);
        }
        if(methodName == 'getCases')
        {
            List<Map<String, Object>> optionList = new List<Map<String, Object>>();
            for(Case curCase : [Select Id,CaseNumber From Case])
            {
                Map<String, Object> option = new Map<String, Object>();
                option.put('name',curCase.id);
                option.put('value', curCase.CaseNumber);
                optionList.add(option);

            }
            System.debug('listOfOptions '+ optionList);
            outMap.put('options', optionList);
            System.debug('options '+outMap);
        }
        return '';
    }
}