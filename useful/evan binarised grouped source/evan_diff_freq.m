%import

sig = [];
for k = 1:4
    for i = 1:17
        file_name = strcat('ch',num2str(k),'_both_grouped_diff_L',num2str(i),'_state_series');
        output = strcat(file_name,'_freq_results');
        face_title = strcat('ch',num2str(k),' source frequency of causal states, face, ml ',num2str(i));
        random_title = strcat('ch',num2str(k),' source frequency of causal states, random, ml ',num2str(i));
        face_plot_title = strcat('ch',num2str(k),'_diff_grouped_face_freq_ml',num2str(i),'.png');
        random_plot_title = strcat('ch',num2str(k),'_diff_grouped_random_freq_ml',num2str(i),'.png');
        
        test = readmatrix(file_name);
        
        %split in half
        %test = test(:,1:500);
        test(isnan(test)) = -1;
        face = test(1:33,:);
        random = test(34:66,:);
        
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
        current_no_sig = strcat('both channel ',num2str(k),' ml ',num2str(i), ' not significant', '\n');
        current_sig = strcat('both channel ',num2str(k), ' ml ',num2str(i), ' significant!', '\n');
        if h == 0
            fprintf(current_no_sig);
        else
            fprintf(current_sig);
        end
        sig(i) = h;
        
        save(strcat(output,'_workspace'));
    end
end