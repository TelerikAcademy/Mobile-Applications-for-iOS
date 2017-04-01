const NAME_MIN_LENGTH = 2;
const NAME_MAX_LENGTH = 50;

const SECRET_IDENTITY_MIN_LENGTH = 0;
const SECRET_IDENTITY_MAX_LENGTH = 500;

const isNameValid = (name) => {
    if (typeof name !== "string") {
        return {
            isValid: false,
            error: "Name must be a string"
        };
    }

    if (name.length < NAME_MIN_LENGTH &&
        name.length > NAME_MAX_LENGTH) {
        return {
            isValid: false,
            error: `Name length must be between ${NAME_MIN_LENGTH} and ${NAME_MAX_LENGTH} characters long`
        };
    }

    return {
        isValid: true
    };
};

const isSecretIdentityValid = (secretIdentity) => {
    if (typeof secretIdentity !== "string") {
        return {
            isValid: false,
            error: "Secret Identity must be a string"
        };
    }

    if (secretIdentity.length < SECRET_IDENTITY_MIN_LENGTH &&
        secretIdentity.length > SECRET_IDENTITY_MAX_LENGTH) {
        return {
            isValid: false,
            error: `Secret Identity's length must be between ${SECRET_IDENTITY_MIN_LENGTH} and ${SECRET_IDENTITY_MAX_LENGTH} characters long`
        };
    }

    return {
        isValid: true
    };
};

const validator = {
    isValid(superhero) {
        if (!superhero) {
            return {
                isValid: false,
                error: "Invalid superhero"
            };
        }

        return isNameValid(superhero.name) && isSecretIdentityValid(superhero.secretIdentity);
    }
};


module.exports = validator;