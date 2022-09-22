function subjectPT = subjectHelper()
    %calculates the subject's individual RT from their practice session
    T = readtable('flanker_practice.csv');
    B = T(any(T.Response==1,2),:);
    subjectPT = mean(B.Time_secs_) + std(B.Time_secs_);
