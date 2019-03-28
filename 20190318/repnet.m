net_12 = train(net,inputs,targets);
disp(perform(net_12,targets, net_12(inputs)));
if perform(net_12,targets, net_12(inputs))< 1.9e7
	save('net.mat','net_12','-append');
	i=i+1;
	clear('net_12');
end
