clf

hand = imread('hand.ppm', 'ppm');
book = imread('book.ppm', 'ppm');
imagesc(hand);
figure;
imagesc(book);

data1 = normalize_and_label(hand, 0);
data2 = normalize_and_label(book, 1);
test_data = [data1; data2];
figure;
hold on;
plot(data2(:,1), data2(:,2), '.');
plot(data1(:,1), data1(:,2), '.r');
legend('Hand holding book', 'Hand');
xlabel('green');
ylabel('red');

data1 = data1(1:10,:)
data2 = data2(1:10,:)
test_data = [data1; data2];

[mu sigma] = bayes(test_data);
mu
sigma