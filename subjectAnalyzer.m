function meanTime = subjectAnalyzer()
    %calculates the subject's mean RT from their daily sessions
    T = readtable('flanker.csv');
    % toggle between correct and incorrect 
    %B = T(any(T.Response=="Correct", 2),:);
    B = T(any(T.Response=="Incorrect", 2),:);

    meanTime = mean(B.Time_secs_);
