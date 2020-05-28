%Proses membaca data latih dari excel
filename = 'bebanlistrik.xlsx';
sheet = 1;
xlRange = 'C31:AX38'; %data input latih
xlRange2 = 'C40:AX40'; %data target

data_latih = xlsread(filename, sheet, xlRange);
target_latih = xlsread(filename, sheet, xlRange2);
%Membuat matriks m n yang ukurannya seperti data_latih
[m,n] = size(data_latih); 
 
%Pembuatan JST
net = newff(minmax(data_latih),[10 1],{'logsig','purelin'},'traingdx'); %10 hidden layer,1 output 
 
%Memberikan nilai untuk mempengaruhi proses pelatihan
net.performFcn = 'mse';
net.trainParam.goal = 0.01; %batasan untuk mse
net.trainParam.show = 25;
net.trainParam.epochs = 2000;
net.trainParam.mc = 0.95;
net.trainParam.lr = 0.01; %laju


%Proses training
[net_keluaran,tr,Y,E] = train(net,data_latih,target_latih);
 
%Hasil setelah pelatihan
bobot_hidden = net_keluaran.IW{1,1};
bobot_keluaran = net_keluaran.LW{2,1};
bias_hidden = net_keluaran.b{1,1};
bias_keluaran = net_keluaran.b{2,1};
jumlah_iterasi = tr.num_epochs;
nilai_keluaran = Y;
nilai_error = E;
error_MSE = (1/n)*sum(nilai_error.^2);

%Menyimpan jaringannya
save net.mat net_keluaran 
 
%Hasil prediksi
hasil_latih = sim(net_keluaran,data_latih);
max_data = 103;
min_data = 23;

%Mengubah data agar tidak dalam bentuk normalisasi lagi
hasil_latih = (hasil_latih*(max_data-min_data))+min_data;

%Performansi hasil prediksi, untuk dibandingkan pada grafik
filename = 'bebanlistrik.xlsx'; 
sheet = 1;
xlRange3 = 'C15:AX15';
 
target_latih_asli = xlsread(filename, sheet, xlRange3); 

figure,
plotperform(tr)
 
figure,
plot(hasil_latih,'bo-')
hold on
plot(target_latih_asli,'ro-')
hold off
grid on
title(strcat(['Grafik Keluaran JST vs Target dengan nilai MSE = ',...
num2str(error_MSE)]))
ylabel('Beban Listrik')
legend('Keluaran JST','Target','Location','Best')

hasil_latih
