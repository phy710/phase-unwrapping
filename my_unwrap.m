function unwrappedPhase = my_unwrap(phase)
    k = 0; % initialize k to 0
    unwrappedPhase = phase;
    diff = phase(2:end) - phase(1:end-1);
    for i = 1:(size(phase)-1)
        unwrappedPhase(i,:) = phase(i) + 2*pi*k; % add 2*pi*k to unwrapped phase
        if diff(i) >= pi % if the phase difference > +pi, k--
            k = k - 1;
        elseif diff(i) < -pi % if the phase difference < -pi, k++
            k = k + 1;
        end
    end
    unwrappedPhase(end,:) = phase(end) + (2*pi*k); % add 2*pi*k to the last element of the input
end