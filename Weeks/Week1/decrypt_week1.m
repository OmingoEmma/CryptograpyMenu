function decryptedMessage = decrypt_week1(encryptedMessage)
    % Convert encrypted message to lowercase
    encryptedMessage = lower(encryptedMessage);
    decryptedMessage = '';

    % Shift value (reverse shift)
    shift = 3;

    % Loop through each character
    for i = 1:length(encryptedMessage)
        char = encryptedMessage(i);

        % Decrypt letters using reverse shift
        if isletter(char)
            shiftedChar = char - shift;
            if shiftedChar < 'a'
                shiftedChar = shiftedChar + 26;
            end
            decryptedMessage = [decryptedMessage, shiftedChar];
        else
            % Keep non-letter characters unchanged
            decryptedMessage = [decryptedMessage, char];
        end
    end
end
