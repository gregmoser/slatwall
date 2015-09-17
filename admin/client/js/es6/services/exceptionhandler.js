/// <reference path="../../../../client/typings/tsd.d.ts" />
/// <reference path="../../../../client/typings/slatwallTypeScript.d.ts" />
var logger;
(function (logger) {
    /*<------------------------------------------------------------------------
      This is out main class where we actually handle the exception by
      instantiating the http config and passing it along with the
      exception and cause. Classes are more the Typescript methodology versus
      function notation - but this compiles down to the function we want.
      <------------------------------------------------------------------------*/
    class ExceptionHandler {
        /** returning the ExceptionHandler bind here removes the circular dependancy
            that you would get from having exceptionHandler require $http <-- exceptionHandler --> $http
         */
        constructor(injector) {
            //grab the injector we passed in 
            ExceptionHandler.injector = injector;
            //return the bound static function.
            return ExceptionHandler.handle.bind(ExceptionHandler);
        }
        static handle(exception, cause) {
            /** get $http and alertService from the injector */
            var http = this.injector.get('$http');
            var alertService = this.injector.get('alertService');
            /**  use the angular serializer rather than jQuery $.param */
            var serializer = this.injector.get('$httpParamSerializerJQLike');
            /* we use the IRequestConfig type here to get type protection on the object literal.
               alternativly, we could just cast to the correct type and drop the extra interface by
               using url: <string> "?slatAction=api:main.log" notation which does the same thing. */
            var requestConfig = {
                url: "?slatAction=api:main.log",
                method: "POST",
                data: serializer({ exception: exception, cause: cause, apiRequest: true }),
                headers: { 'Content-Type': "application/x-www-form-urlencoded" }
            };
            /** notice I use the fat arrow for the anon function which preserves lexical scope. */
            http(requestConfig).error(data => {
                alertService.addAlert({ msg: exception, type: 'error' });
                console.log(exception);
            });
        } //<--end handle method
    }
    logger.ExceptionHandler = ExceptionHandler; //<--end class
    //let angular know about our class. notive we pass in the $injector and instantiate the class in one go
    //again using the fat arrow for scope.
    angular.module('logger', []).factory('$exceptionHandler', ['$injector', ($injector) => new logger.ExceptionHandler($injector)]);
})(logger || (logger = {})); //<--end module

//# sourceMappingURL=../services/exceptionhandler.js.map