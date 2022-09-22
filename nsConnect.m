NSHost = '10.10.10.42';
% Netstation startup
    % connect --> works BC
    [NSConnectStatus, NSConnectError] = NetStation('Connect', NSHost);
    % synch
    [NSSyncStatus, NSSyncError] = NetStation('Synchronize');
    % start recording
    [NSStartStatus, ~] = NetStation('StartRecording');
