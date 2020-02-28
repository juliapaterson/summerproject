%import

sig = [];
for k = 4
    for i = 10
        file_name = strcat('ch',num2str(k),'source_phase3_L',num2str(i),'_state_series');
        output = strcat(file_name,'_freq_results');
        face_title = strcat('ch',num2str(k),' source frequency of causal states, face, ml ',num2str(i));
        random_title = strcat('ch',num2str(k),' source frequency of causal states, random, ml ',num2str(i));
        face_plot_title = strcat('ch',num2str(k),'_source_face_freq_ml',num2str(i),'.png');
        random_plot_title = strcat('ch',num2str(k),'_source_random_freq_ml',num2str(i),'.png');
        
        test = readmatrix(file_name);
        
        %split in half
        test = test(:,2:501);
        face = test(1:200,:);
        random = test(201:400,:);
        
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
        sig(i) = h;
        
        save(strcat(output,'_workspace'));
    end
end