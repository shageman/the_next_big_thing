Teaser.SignUp = function () {
}

Teaser.SignUp.prototype.initialize = function (inputSelector, resultSelector, signUpEndpoint) {
    this.signUpEndpoint = signUpEndpoint;
    this.$inputElement = $(inputSelector);
    this.$resultElement = $(resultSelector);
    this.$inputElement.on("keydown", $.proxy(this.signUpIfSubmitted, this));
}

Teaser.SignUp.prototype.signUp = function () {
    var that = this;
    $.post(this.signUpEndpoint, { new_sign_up_entry:this.$inputElement.val() }, function (data) {
    })
        .success(function (result) {
            $.proxy(that.handleSubmissionResult("success", result), that)
        })
        .error(function (result) {
            $.proxy(that.handleSubmissionResult("error", result), that)
        });
}

Teaser.SignUp.prototype.signUpIfSubmitted = function (e) {
    var key = (e.keyCode ? e.keyCode : e.which);
    if (key == 13) {
        e.preventDefault();
        $.proxy(this.signUp(), this);
    }
}

Teaser.SignUp.prototype.handleSubmissionResult = function (result, data) {
    var responseText = data.responseText || data;
    this.$resultElement.prepend("<p class='" + result + "'>" + responseText + "</p>");
}