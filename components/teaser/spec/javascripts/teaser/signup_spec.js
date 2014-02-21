describe("Teaser.SignUp", function () {
    describe("#initialize", function () {
        it("should transform the given parameters into variables on the object", function () {
            $("#jasmine_content").html("<p class='input'>within p</p><div class='result'>within div</div>");
            var signUp = new Teaser.SignUp;
            signUp.initialize(".input", ".result", "signUpEndpoint");

            expect(signUp.signUpEndpoint).toEqual("signUpEndpoint");
            expect(signUp.$inputElement.html()).toEqual("within p");
            expect(signUp.$resultElement.html()).toEqual("within div");
        });

        it("should register signUpIfSubmitted on keydowns in the input", function () {
            var signUpIfSubmitted = spyOn(Teaser.SignUp.prototype, "signUpIfSubmitted");

            $("#jasmine_content").html("<p class='input'>within p</p><div class='result'>within div</div>");
            var signUp = new Teaser.SignUp;
            signUp.initialize(".input", ".result", "signUpEndpoint");

            $(".input").trigger("keydown")

            expect(signUpIfSubmitted).toHaveBeenCalled();
        });
    });

    describe("#signUp", function () {
        var handleSubmissionResult, request;
        var callAjax = function () {
            jasmine.Ajax.install();

            handleSubmissionResult = spyOn(Teaser.SignUp.prototype, "handleSubmissionResult");

            var signUp = new Teaser.SignUp;
            signUp.signUpEndpoint = "signUpEndpoint";
            signUp.$inputElement = {val:function () {
                return "value of input"
            }}

            signUp.signUp();

            request = jasmine.Ajax.requests.mostRecent();
        }

        it("should post the value of the input element to the signUpEndpoint", function () {
			pending("don't yet know how to do this test with the new jasmine API")
            var post = spyOn($, "post").andCallThrough();

            callAjax();

            expect(post).toHaveBeenCalledWith("signUpEndpoint", { new_sign_up_entry:"value of input" }, jasmine.any(Function));
        });

        it("should call handleSubmissionResult with success if the ajax call is successful", function () {
            callAjax();
            request.response({status:200, responseText:"{}"});

            expect(handleSubmissionResult).toHaveBeenCalledWith("success", {});
        });

        it("should call handleSubmissionResult with error if the ajax call is unsuccessful", function () {
            callAjax();
            request.response({status:400, responseText:""});

            expect(handleSubmissionResult).toHaveBeenCalledWith("error", jasmine.any(Object));
        });
    });

    describe("#signUpIfSubmitted", function () {
        var signUp, event;
        beforeEach(function () {
            signUp = new Teaser.SignUp;
            spyOn(signUp, "signUp");

            event = jQuery.Event("keydown");
        });

        describe("when the key pressed is Enter", function () {
            beforeEach(function () {
                event.keyCode = 13;
            });

            it("should prevent default", function () {
                spyOn(event, "preventDefault");
                signUp.signUpIfSubmitted(event);
                expect(event.preventDefault).toHaveBeenCalled();
            });

            it("should call signUp", function () {
                signUp.signUpIfSubmitted(event);
                expect(signUp.signUp).toHaveBeenCalled();
            });
        });

        describe("when the key pressed is not Enter", function () {
            beforeEach(function () {
                event.keyCode = 14;
            });

            it("should not prevent default", function () {
                spyOn(event, "preventDefault");
                signUp.signUpIfSubmitted(event);
                expect(event.preventDefault).not.toHaveBeenCalled();
            });

            it("should not call signUp", function () {
                signUp.signUpIfSubmitted(event);
                expect(signUp.signUp).not.toHaveBeenCalled();
            });
        });
    });

    describe("handleSubmissionResult", function () {
        var signUp;

        beforeEach(function () {
            $("#jasmine_content").html("<div class='result'></div>");
            signUp = new Teaser.SignUp;
            signUp.$resultElement = $(".result");
        });

        it("should prepend the result's responseText to the $resultElement", function () {
            signUp.handleSubmissionResult("success_class", {responseText: "this was a success"});
            expect(signUp.$resultElement.html()).toEqual('<p class="success_class">this was a success</p>');
        });

        it("should prepend the result to the $resultElement (if there is no responseText)", function () {
            signUp.handleSubmissionResult("success_class", "this was also a success");
            expect(signUp.$resultElement.html()).toEqual('<p class="success_class">this was also a success</p>');
        });
    });
});