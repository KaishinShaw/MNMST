% �˺�������һ��ͼ���ڽӾ���ʹ���׾����㷨����ڵ�ľ������
% CMat: NxN���ڽӾ���
% n: ����Ĵ���
% groups: Nά����������ͨ���׾����õ�n���صĶ�Ӧ��Ա



function groups = SpectralClustering(CKSym,n)

warning off;
N = size(CKSym,1);

% KMeans������������
MAXiter = 1000;

% KMeans�ĸ�������
REPlic = 20;

% ��һ���׾���
% ʹ�ù�һ���Գ�������˹���� L = I - D^{-1/2} W D^{-1/2}

DN = diag( 1./sqrt(sum(CKSym)+eps));
LapN = double(speye(N)) - double(DN * CKSym * DN);   %%%  double
[uN,sN,vN] = svd(LapN);
kerN = vN(:,N-n+1:N);
for i = 1:N
    kerNS(i,:) = kerN(i,:) ./ norm(kerN(i,:)+eps);
end

%ʹ��KMeans���о���
groups = kmeans(kerNS,n,'maxiter',MAXiter,'replicates',REPlic,'EmptyAction','singleton');