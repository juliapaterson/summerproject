%import
%frontal = [8,9,20,21,22,23,33,34,35];
%occipital = [1,2,5,6,10,11,12,13,24];
%parietal = [3,7,14,15,16,17,18,19,25];
%lefttemporal = [26,28,30,31,36,38,40,42,44];
%righttemporal = [4,27,29,31,37,39,41,43,45];

sig = [];
for k = [1,2,5,6,10,11,12,13,24]
    for i = 2:10
        file_name = strcat('ch',num2str(k),'concat_phase3_L',num2str(i),'_state_series');
        output = strcat(file_name,'_freq_results');
        face_title = strcat('ch',num2str(k),' frequency of causal states, face, ml ',num2str(i));
        random_title = strcat('ch',num2str(k),' frequency of causal states, random, ml ',num2str(i));
        face_plot_title = strcat('ch',num2str(k),'_face_freq_ml',num2str(i),'.png');
        random_plot_title = strcat('ch',num2str(k),'_random_freq_ml',num2str(i),'.png');
        
        test = readmatrix(file_name);
        
        %split in half
        face = test(1:213,:);
        random = test(214:426,:);
        
        %count
        a = unique(face);
        a = rmmissing(a);
        
        face_count = [histcounts(face(:),a)];
        
        b = unique(random);
        b = rmmissing(b);
        
        random_count = [histcounts(random(:),b)];
        
        %plot
        figure(1),clf;
        histogram(face,a,'FaceColor','k')
        xlabel('causal state')
        ylabel('frequency')
        title(face_title)
        saveas(1,face_plot_title)
        
        figure(2),clf;
        histogram(random,b,'FaceColor','k')
        xlabel('causal state')
        ylabel('frequency')
        title(random_title)
        saveas(2,random_plot_title)
        
        [h,p,ci,stats] = ttest2(face_count,random_count);
        sig(i) = h
        
        save(strcat(output,'_workspace'));
    end
end