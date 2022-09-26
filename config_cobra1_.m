function [cfg,expParam] = config_cobra1_(cfg,expParam)
% function [cfg,expParam] = config_expe(cfg,expParam)
%
% Description:
%  Configuration function for memorization experiment. This
%  file should be edited for your particular experiment.

%% Experiment session information

% Set the number of sessions
expParam.nSessions = 28; % Change back to 28 for Day1 Day2 Testing
expParam.sesTypes = {'stud1','test1','stud2','test2','stud3','test3','stud4','test4','stud5','test5','stud6','test6','stud7','test7','stud8','test8','stud9','test9','stud10','test10','stud11','test11','stud12','test12','stud13','test13','stud14','test14'};

%% If this is session 1, setup the experiment
if expParam.sessionNum == 1
    %% Screen parameters
    cfg.screen.bgColor = uint8((rgb('Black') * 255) + 0.5); %changed from white to black
    
    %% Stimulus parameters
    
    % the file extension for your images
    cfg.files.stimFileExt = '.png';
    
    % scale stimlus down (< 1) or up (> 1)
    cfg.stim.stimScale = 1;
    
    % image directory
    cfg.files.stimDir = fullfile(cfg.files.expDir,'imagesNew'); % new directory 887 words
    % Images name = obj + number (001 to 999 with no missing number) + name
    % list directory
    %cfg.files.stimListDir = fullfile(cfg.files.expDir,'stimList');
    
    % number of items
    % for the study list
    cfg.stim.nStudy = 20; % change to 20
    % for the test list
    cfg.stim.nTestNew = 20; % change to 20
    cfg.stim.nTestOld = 20; % change to 20
    % # of non test buffers at the beginning and end
    cfg.stim.nonTestBuffersStudy = 3; %change back to 3
    
    % whether to use different list for each study session
    cfg.stim.differentStimList = false; % change back to false
    % stimuli list: random or predefine
    cfg.stim.stimListRandom = false; % change back to false
    % whether to shuffle the stimulus list for presentation
    cfg.stim.shuffle = false; % change back to false
    
    % type of items
    % i = images, w = word, TODO: iw = half/half
    % for the study list
    cfg.stim.studyType = 'w';
    % for the test list
    cfg.stim.testType = 'w';
    
    %% Define the response keys
    
    % the experimenter's secret key to continue the experiment
    cfg.keys.expContinue = 'g';
    cfg.keys.expContKey = KbName('G');
    
    cfg.keys.keyRow = 'upper';
    
    % uniform subject response keys
    cfg.keys.responseKeyNames = {'f','j'};
    
    % new counterbalancing (key assignments and intox/sober list assignment
     if mod(str2double(expParam.subject(end)), 4) == 1
        % intox first --> left is old
        % 1 - 14 = first session
        cfg.keys.oldKey = cfg.keys.responseKeyNames{1};
        cfg.keys.newKey = cfg.keys.responseKeyNames{2};
        cfg.files.stimListDir = fullfile(cfg.files.expDir,'intoxF');

    elseif mod(str2double(expParam.subject(end)), 4) == 2
        % sober first --> left is old
        % 15 - 28 = first session
        cfg.keys.oldKey = cfg.keys.responseKeyNames{1};
        cfg.keys.newKey = cfg.keys.responseKeyNames{2};
        cfg.files.stimListDir = fullfile(cfg.files.expDir,'soberF');

    elseif mod(str2double(expParam.subject(end)), 4) == 3
        % intox first --> left is new
        % 1 - 14 = first session
        cfg.keys.oldKey = cfg.keys.responseKeyNames{2};
        cfg.keys.newKey = cfg.keys.responseKeyNames{1};
        cfg.files.stimListDir = fullfile(cfg.files.expDir,'intoxF');
    
    elseif mod(str2double(expParam.subject(end)), 4) == 0
        % sober first --> left is new
        % 15 - 28 = first session
        cfg.keys.oldKey = cfg.keys.responseKeyNames{2};
        cfg.keys.newKey = cfg.keys.responseKeyNames{1};
        cfg.files.stimListDir = fullfile(cfg.files.expDir,'soberF');

    end
    
    %% Screen, text, and symbol configuration for size and color
    
    % Choose a color value (e.g., 210 for gray) to be used as experiment backdrop
    cfg.screen.bgColor = uint8((rgb('Black') * 255) + 0.5); %changed from white to black
    
    % font sizes
    % basic: small messages printed to the screen
    % instruct: instructions
    % fixSize: fixation
    if ispc
        cfg.text.basicTextSize = 72; %changed from 18
        cfg.text.instructTextSize = 36; %changed from 18
        cfg.text.fixSize = 72; %changed from 18
    elseif ismac
        cfg.text.basicTextSize = 32;
        cfg.text.instructTextSize = 28;
        cfg.text.fixSize = 32;
    elseif isunix
        cfg.text.basicTextSize = 24;
        cfg.text.instructTextSize = 18;
        cfg.text.fixSize = 24;
    end
    
    % text colors
    cfg.text.basicTextColor = uint8((rgb('White') * 255) + 0.5); %changed from black to white
    cfg.text.instructColor = uint8((rgb('White') * 255) + 0.5); %changed from black to white
    % text color when experimenter's attention is needed
    cfg.text.experimenterColor = uint8((rgb('Red') * 255) + 0.5);
    
    cfg.text.basicFontName = 'Courier New';
    cfg.text.basicFontStyle = 1;
    
    % number of characters wide at which any text will wrap
    cfg.text.instructCharWidth = 70;
    
    % key to push to dismiss instruction screen
    cfg.keys.instructContKey = 'space';
    
    % fixation info
    cfg.text.fixSymbol = '+';
    cfg.text.respSymbol = '?';
    cfg.text.fixationColor = uint8((rgb('White') * 255) + 0.5); %changed from black to white
    
    % fixation defaults; change in phases if you want other behavior
    fixDuringISI = true;
    fixDuringPreStim = true;
    fixDuringStim = false;
    
    % "respond faster" text
    cfg.text.respondFaster = 'No response recorded!\nRespond faster!';
    cfg.text.respondFasterColor = uint8((rgb('Red') * 255) + 0.5);
    cfg.text.respondFasterFeedbackTime = 1.5;
    
    % error text color
    cfg.text.errorTextColor = uint8((rgb('Red') * 255) + 0.5);
    
    %% Session configuration
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for s = 1 : expParam.nSessions/2
        sesName = ['stud' num2str(s)];
        if ismember(sesName,expParam.sesTypes)
            cfg.stim.(sesName).fixDuringISI = fixDuringISI;
            cfg.stim.(sesName).fixDuringPreStim = fixDuringPreStim;
            cfg.stim.(sesName).fixDuringStim = fixDuringStim;
            
            % durations, in seconds
            %cfg.stim.(sesName).isi = 0.5;
            cfg.stim.(sesName).stim = 1.0;
            % random intervals are generated on the fly
            cfg.stim.(sesName).isFix = true;
            cfg.stim.(sesName).preStim = [1 1.2];
            % create the stimulus list
            cfg.stim.(sesName).stimListFile = fullfile(cfg.files.subSaveDir,['stimList_' sesName '.txt']);
            [cfg,expParam] = mt_saveStimList_images(cfg,expParam,sesName);
            
            % instruction message
            m1 = 'You are going to be shown a series of stimuli.\n\n\n\n';
            m2 = 'Your task is to memorize them. You will be tested on them later.\n\n\n\n';
            m3 = 'Press any key to start.';
            cfg.text.(sesName).instructionsMessage = [m1 m2 m3];
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for s = 1 : expParam.nSessions/2
        sesName = ['test' num2str(s)];
        if ismember(sesName,expParam.sesTypes)
            cfg.stim.(sesName).fixDuringISI = fixDuringISI;
            cfg.stim.(sesName).fixDuringPreStim = fixDuringPreStim;
            cfg.stim.(sesName).fixDuringStim = fixDuringStim;
            
            % durations, in seconds
            cfg.stim.(sesName).isi = 1.0;
            cfg.stim.(sesName).stim = 2.0;
            % random intervals are generated on the fly
            cfg.stim.(sesName).isFix = true;
            cfg.stim.(sesName).preStim = [0.5 1.0];
            % whether to answer as fast as possible or after the stimuli ?
            % true = as fast as possible
            cfg.stim.(sesName).answerFast = false;
            % create the stimulus list
            cfg.stim.(sesName).stimListFile = fullfile(cfg.files.subSaveDir,['stimList_' sesName '.txt']);
            [cfg,expParam] = mt_saveStimList_images(cfg,expParam,sesName);
            
           
            
            % instruction message
            m1 = 'You are going to be shown a series of stimuli.\n\n\n\n';
            m2 = 'Your task is to decide which stimuli was seen\n\n';
            m3 = 'during the first part of the experiment.\n\n\n\n';
            m4 = ['Press "' cfg.keys.oldKey '" if you have seen the stimuli.\n\n'];
            m5 = ['Press "' cfg.keys.newKey '" if you have NOT seen the stimuli.\n\n\n\n'];
            m6 = 'Please put your fingers on the keys before starting.\n\n\n\n';
            m7 = 'Press any key to start.';
            cfg.text.(sesName).instructionsMessage = [m1 m2 m3 m4 m5 m6 m7];
        end
    end
end