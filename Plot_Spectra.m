%%%%%%%%%%%%%%%%% To generate graphs in the range defined by intial and final values of binding energy
%%%%%%%%%%%% XPS spectra are plotted with decreasing binding energy values along X-axis. So, intial is greater than final.

function Plot_Spectra(intial,final)

%%%%%%%%%%%read all TXT files in the directory that starts with 'after'
folder_with_data_files = dir('after*.txt');  

%%%%%%%%%%%%% define arrays for binding energy, time, intensity
binding_energy_range = intial:-0.05:final;
time = [0:7, 10, 15, 19, 21];
intensity_matrix = zeros(length(binding_energy_range), length(folder_with_data_files));
normalized_intensity_matrix = zeros(length(binding_energy_range), length(folder_with_data_files));
Xvalues_3Dplot = zeros(length(binding_energy_range), length(folder_with_data_files));
Yvalues_3Dplot = zeros(length(binding_energy_range), length(folder_with_data_files));

%%%%%%%%%%% read files from the folder and store the intensity values into intensity_matrix
for ii = 1:length(folder_with_data_files)
  filename = folder_with_data_files(ii).name;
  temporary_data_storage = dlmread(filename,'',1,0);  %%%%%%%skip 1st row because of header
  indices_for_BE_range = find(temporary_data_storage(:,1)<=intial & temporary_data_storage(:,1)>=final);
  intensity = temporary_data_storage(indices_for_BE_range,2); %%%%each file has intensity on 2nd column and binding energy on 1st column
  intensity_normalized = (intensity-min(intensity))/(max(intensity)-min(intensity));
  
  intensity_matrix(:,ii) = intensity;
  normalized_intensity_matrix(:,ii) = intensity_normalized;
  Xvalues_3Dplot(:,ii) = binding_energy_range;
  Yvalues_3Dplot(:,ii) = time(ii);
 end
 
 
 %%%%%%%%%%%%%%% plot the spectrum 
 
 
%%%%%%%%%%% generate subplots comparing evolution of spectrum at different time with that obtained from control UHV spectrum
figure(1) 
subplot(2,3,1)
plot(binding_energy_range,normalized_intensity_matrix(:,1),'r-',binding_energy_range,normalized_intensity_matrix(:,5),'b-','LineWidth',2)
axis([final,intial,0,1])
legend('UHV','4 hours')
xlabel('Binding Energy (eV)')
ylabel('Normalized Intensity (arb. units)')
set(gca,'ytick',[]);
set(gca,'yticklabel',[])
set(gca,'xdir','reverse')


subplot(2,3,2)
plot(binding_energy_range,normalized_intensity_matrix(:,1),'r-',binding_energy_range,normalized_intensity_matrix(:,6),'b-','LineWidth',2)
axis([final,intial,0,1])
legend('UHV','5 hours')
xlabel('Binding Energy (eV)')
ylabel('Normalized Intensity (arb. units)')
set(gca,'ytick',[]);
set(gca,'yticklabel',[])
set(gca,'xdir','reverse')


subplot(2,3,3)
plot(binding_energy_range,normalized_intensity_matrix(:,1),'r-',binding_energy_range,normalized_intensity_matrix(:,7),'b-','LineWidth',2)
axis([final,intial,0,1])
legend('UHV','6 hours')
xlabel('Binding Energy (eV)')
ylabel('Normalized Intensity (arb. units)')
set(gca,'ytick',[]);
set(gcs,'yticklabel',[])
set(gca,'xdir','reverse')

subplot(2,3,4)
plot(binding_energy_range,normalized_intensity_matrix(:,1),'r-',binding_energy_range,normalized_intensity_matrix(:,10),'b-','LineWidth',2)
axis([final,intial,0,1])
legend('UHV','15 hours')
xlabel('Binding Energy (eV)')
ylabel('Normalized Intensity (arb. units)')
set(gca,'ytick',[]);
set(gca,'yticklabel',[])
set(gca,'xdir','reverse')


subplot(2,3,5)
plot(binding_energy_range,normalized_intensity_matrix(:,1),'r-',binding_energy_range,normalized_intensity_matrix(:,11),'b-','LineWidth',2)
axis([final,intial,0,1])
legend('UHV','19 hours')
xlabel('Binding Energy (eV)')
ylabel('Normalized Intensity (arb. units)')
set(gca,'ytick',[]);
set(gca,'yticklabel',[])
set(gca,'xdir','reverse')

subplot(2,3,6)
plot(binding_energy_range,normalized_intensity_matrix(:,1),'r-',binding_energy_range,normalized_intensity_matrix(:,12),'b-','LineWidth',2)
axis([final,intial,0,1])
legend('UHV','21 hours')
xlabel('Binding Energy (eV)')
ylabel('Normalized Intensity (arb. units)')
set(gca,'ytick',[]);
set(gca,'yticklabel',[])
set(gca,'xdir','reverse')


%%%%%%%%%%%%%%% generate contour plot
figure(2)
contourf(binding_energy_range,time, normalized_intensity_matrix')
colorbar
xlabel('Binding Energy (eV)')
ylabel('Time (hrs)')
set(gca,'xdir','reverse')


%%%%%%%%%%%%%% generate 3D plot
figure(3)
plot3(Xvalues_3Dplot,Yvalues_3Dplot,normalized_intensity_matrix,'linewidth',2)
xlabel('Binding Energy (eV)')
ylabel('Time (hrs)')
zlabel('Normalized Intensity (arb. units)')
legend('UHV','1 hour','2 hour','3 hour','4 hour','5 hour','6 hour','7 hour','10 hour','15 hour','19 hour','21 hour')
set(gca,'xdir','reverse')
set(gca,'ztick',[],'zticklabel',[])

  
