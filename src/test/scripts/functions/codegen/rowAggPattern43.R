#-------------------------------------------------------------
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
#-------------------------------------------------------------

args<-commandArgs(TRUE)
options(digits=22)
library("Matrix")

N = 64
C = 4
H = 12
W = 12
X = matrix(7, N, C*H*W);
B = as.matrix(seq(1, C))
ones = matrix(1, 1, H*W)

R1 = X + (matrix(1,N,1) %*% matrix(t(B%*%ones), 1, C*H*W))
R2 = X * (matrix(1,N,1) %*% matrix(t(B%*%ones), 1, C*H*W))
R = (R1 + R2) / (rowSums(X) %*% matrix(1,1,ncol(X)));

R = as.matrix(sum(R));


writeMM(as(R,"CsparseMatrix"), paste(args[2], "S", sep=""));
