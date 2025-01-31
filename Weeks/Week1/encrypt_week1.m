function encryptedMessage = encrypt_week1(message)
    % Convert message to lowercase
    message = lower(message);
    encryptedMessage = '';

    % Shift value
    shift = 3;

    % Loop through each character
    for i = 1:length(message)
        char = message(i);

        % Encrypt letters using shift
        if isletter(char)
            shiftedChar = char + shift;
            if shiftedChar > 'z'
                shiftedChar = shiftedChar - 26;
            end
            encryptedMessage = [encryptedMessage, shiftedChar];
        else
            % Keep non-letter characters unchanged
            encryptedMessage = [encryptedMessage, char];
        end
    end
end
