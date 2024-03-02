function bsplinedraw(indexes)
    t = linspace(0, 1, 1000);
    B = zeros(size(t));

    for i = 1:length(indexes) - 1
        B = B + basis(i, length(indexes) - 1, t, indexes);
    end

    plot(t, B);
    title('B-Spline Curve');
end

function N = basis(i, k, t, indexes)
    if k == 0
        N = (t >= indexes(i)) & (t < indexes(i + 1));
    else
        if i + k + 1 <= length(indexes)
            alpha = (t - indexes(i)) / (indexes(i + k) - indexes(i));
            beta = (indexes(i + k + 1) - t) / (indexes(i + k + 1) - indexes(i + 1));

            N = alpha .* basis(i, k - 1, t, indexes) + beta .* basis(i + 1, k - 1, t, indexes);
        else
            N = 0;  % Return 0 if index is out of bounds
        end
    end
end
