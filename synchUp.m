%synchUp.m
%yInitial is the inital state(column) vector, W is the connectivity
%matrix, nTs is the number of time steps, and Y is an array to hold
%state vector y through time

function Y = synchUp(yInitial,W,nTs) %declare the function

[dum,nUnits]=size(W); % find the number of units in the network

Y = zeros(nTs, nUnits); % zero the output Y array
y=yInitial; %initialize the state of y to yInitial
for t=1:nTs %for each time step
    q=W*y; % synchronously update y
    y=q>0; % impose the threshold nonlinearity
    Y(t,:)=y'; % save this state y to the output array Y
end%end the synch update loop
Y=[yInitial';Y];%place the yInitial as the first row of Y