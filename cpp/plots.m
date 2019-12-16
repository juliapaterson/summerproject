%%
plot(2:16, face_timestamps)
title('time taken for CSSR to run with increasing memory lengths')
xlabel('memory length')
ylabel('time (seconds)')
%%
plot(2:16, face_complexities)
title('statistical complexity of CSSR epsilon machines with increasing memory length')
xlabel('memory length')
ylabel('statistical complexity')