void plot_mc_nlo_vs_lo_zjet_genCuts_logx1to1k()
{
//=========Macro generated from canvas: c1/c1
//=========  (Wed Aug 31 20:45:00 2016) by ROOT version6.06/01
   TCanvas *c1 = new TCanvas("c1", "c1",0,22,550,550);
   gStyle->SetOptStat(0);
   gStyle->SetOptTitle(0);
   c1->Range(-0.4474194,0.8679604,3.181443,1.271543);
   c1->SetFillColor(0);
   c1->SetBorderMode(0);
   c1->SetBorderSize(2);
   c1->SetLogx();
   c1->SetTickx(1);
   c1->SetTicky(1);
   c1->SetLeftMargin(0.15);
   c1->SetRightMargin(0.05);
   c1->SetTopMargin(0.05);
   c1->SetBottomMargin(0.15);
   c1->SetFrameFillStyle(0);
   c1->SetFrameBorderMode(0);
   c1->SetFrameFillStyle(0);
   c1->SetFrameBorderMode(0);
   Double_t xAxis3[34] = {0, 1.25, 2.5, 3.75, 5, 6.25, 7.5, 8.75, 10, 11.25, 12.5, 15, 17.5, 20, 25, 30, 35, 40, 45, 50, 60, 70, 80, 90, 100, 110, 130, 150, 170, 190, 220, 250, 400, 1000}; 
   
   TH1D *hzpt3krnlolo__3 = new TH1D("hzpt3krnlolo__3","hzpg1",33, xAxis3);
   hzpt3krnlolo__3->SetBinContent(1,0.9555812);
   hzpt3krnlolo__3->SetBinContent(2,0.9535785);
   hzpt3krnlolo__3->SetBinContent(3,0.9540397);
   hzpt3krnlolo__3->SetBinContent(4,0.9488329);
   hzpt3krnlolo__3->SetBinContent(5,0.9494296);
   hzpt3krnlolo__3->SetBinContent(6,0.9492043);
   hzpt3krnlolo__3->SetBinContent(7,0.9476451);
   hzpt3krnlolo__3->SetBinContent(8,0.9459505);
   hzpt3krnlolo__3->SetBinContent(9,0.9445184);
   hzpt3krnlolo__3->SetBinContent(10,0.94709);
   hzpt3krnlolo__3->SetBinContent(11,0.9514592);
   hzpt3krnlolo__3->SetBinContent(12,0.9630316);
   hzpt3krnlolo__3->SetBinContent(13,0.9892554);
   hzpt3krnlolo__3->SetBinContent(14,1.037637);
   hzpt3krnlolo__3->SetBinContent(15,1.075272);
   hzpt3krnlolo__3->SetBinContent(16,1.082776);
   hzpt3krnlolo__3->SetBinContent(17,1.093096);
   hzpt3krnlolo__3->SetBinContent(18,1.102396);
   hzpt3krnlolo__3->SetBinContent(19,1.112051);
   hzpt3krnlolo__3->SetBinContent(20,1.123464);
   hzpt3krnlolo__3->SetBinContent(21,1.139805);
   hzpt3krnlolo__3->SetBinContent(22,1.155314);
   hzpt3krnlolo__3->SetBinContent(23,1.177526);
   hzpt3krnlolo__3->SetBinContent(24,1.180061);
   hzpt3krnlolo__3->SetBinContent(25,1.185343);
   hzpt3krnlolo__3->SetBinContent(26,1.188248);
   hzpt3krnlolo__3->SetBinContent(27,1.183066);
   hzpt3krnlolo__3->SetBinContent(28,1.189148);
   hzpt3krnlolo__3->SetBinContent(29,1.205523);
   hzpt3krnlolo__3->SetBinContent(30,1.207485);
   hzpt3krnlolo__3->SetBinContent(31,1.199118);
   hzpt3krnlolo__3->SetBinContent(32,1.192885);
   hzpt3krnlolo__3->SetBinContent(33,1.200955);
   hzpt3krnlolo__3->SetBinContent(34,1.28008);
   hzpt3krnlolo__3->SetBinError(1,0.002189861);
   hzpt3krnlolo__3->SetBinError(2,0.001356709);
   hzpt3krnlolo__3->SetBinError(3,0.001188266);
   hzpt3krnlolo__3->SetBinError(4,0.001156795);
   hzpt3krnlolo__3->SetBinError(5,0.001183576);
   hzpt3krnlolo__3->SetBinError(6,0.001226901);
   hzpt3krnlolo__3->SetBinError(7,0.001274512);
   hzpt3krnlolo__3->SetBinError(8,0.001323856);
   hzpt3krnlolo__3->SetBinError(9,0.00137811);
   hzpt3krnlolo__3->SetBinError(10,0.001443423);
   hzpt3krnlolo__3->SetBinError(11,0.001097037);
   hzpt3krnlolo__3->SetBinError(12,0.001216089);
   hzpt3krnlolo__3->SetBinError(13,0.001372435);
   hzpt3krnlolo__3->SetBinError(14,0.0011704);
   hzpt3krnlolo__3->SetBinError(15,0.001453679);
   hzpt3krnlolo__3->SetBinError(16,0.001743984);
   hzpt3krnlolo__3->SetBinError(17,0.002063548);
   hzpt3krnlolo__3->SetBinError(18,0.002404003);
   hzpt3krnlolo__3->SetBinError(19,0.002767836);
   hzpt3krnlolo__3->SetBinError(20,0.002366275);
   hzpt3krnlolo__3->SetBinError(21,0.003012427);
   hzpt3krnlolo__3->SetBinError(22,0.003771189);
   hzpt3krnlolo__3->SetBinError(23,0.00469576);
   hzpt3krnlolo__3->SetBinError(24,0.005673969);
   hzpt3krnlolo__3->SetBinError(25,0.006722022);
   hzpt3krnlolo__3->SetBinError(26,0.005908071);
   hzpt3krnlolo__3->SetBinError(27,0.007772626);
   hzpt3krnlolo__3->SetBinError(28,0.01001975);
   hzpt3krnlolo__3->SetBinError(29,0.0126225);
   hzpt3krnlolo__3->SetBinError(30,0.01338568);
   hzpt3krnlolo__3->SetBinError(31,0.01772036);
   hzpt3krnlolo__3->SetBinError(32,0.01458882);
   hzpt3krnlolo__3->SetBinError(33,0.0350344);
   hzpt3krnlolo__3->SetBinError(34,0.4661875);
   hzpt3krnlolo__3->SetEntries(509216.6);
   
   TF1 *fczpt43 = new TF1("fczpt4","[0]-[1]*TMath::Erf((x-[2])/[3])+[4]*TMath::Erf((x-[5])/[6])-[7]*TMath::Erf((x-[8])/[9])+[10]*TMath::Erf((x-[11])/[12])-[13]*TMath::Erf((x-[14])/[15])+[16]*TMath::Erf((x-[17])/[18])",0,1000);
   fczpt43->SetNpx(10000);
   fczpt43->SetFillColor(19);
   fczpt43->SetFillStyle(0);
   fczpt43->SetMarkerStyle(20);
   fczpt43->SetLineColor(2);
   fczpt43->SetLineWidth(2);
   fczpt43->SetChisquare(14.27699);
   fczpt43->SetNDF(14);
   fczpt43->GetXaxis()->SetLabelFont(42);
   fczpt43->GetXaxis()->SetLabelOffset(0.007);
   fczpt43->GetXaxis()->SetLabelSize(0.05);
   fczpt43->GetXaxis()->SetTitleSize(0.06);
   fczpt43->GetXaxis()->SetTitleOffset(1.2);
   fczpt43->GetXaxis()->SetTitleFont(42);
   fczpt43->GetYaxis()->SetLabelFont(42);
   fczpt43->GetYaxis()->SetLabelOffset(0.007);
   fczpt43->GetYaxis()->SetLabelSize(0.05);
   fczpt43->GetYaxis()->SetTitleSize(0.06);
   fczpt43->GetYaxis()->SetTitleFont(42);
   fczpt43->SetParameter(0,1.07005);
   fczpt43->SetParError(0,0.002687483);
   fczpt43->SetParLimits(0,0,0);
   fczpt43->SetParameter(1,0.01270075);
   fczpt43->SetParError(1,0.002401312);
   fczpt43->SetParLimits(1,0,0);
   fczpt43->SetParameter(2,5);
   fczpt43->SetParError(2,4.782812);
   fczpt43->SetParLimits(2,5,12);
   fczpt43->SetParameter(3,6.95847);
   fczpt43->SetParError(3,1.749241);
   fczpt43->SetParLimits(3,0,0);
   fczpt43->SetParameter(4,0.05764208);
   fczpt43->SetParError(4,0.001476106);
   fczpt43->SetParLimits(4,0,0);
   fczpt43->SetParameter(5,20.4035);
   fczpt43->SetParError(5,0.1422064);
   fczpt43->SetParLimits(5,20,40);
   fczpt43->SetParameter(6,5.244336);
   fczpt43->SetParError(6,0.2271998);
   fczpt43->SetParLimits(6,0,0);
   fczpt43->SetParameter(7,-0.8322264);
   fczpt43->SetParError(7,0.003178283);
   fczpt43->SetParLimits(7,0,0);
   fczpt43->SetParameter(8,95.9902);
   fczpt43->SetParError(8,0.5800586);
   fczpt43->SetParLimits(8,80,100);
   fczpt43->SetParameter(9,74.35901);
   fczpt43->SetParError(9,0.6745776);
   fczpt43->SetParLimits(9,0,0);
   fczpt43->SetParameter(10,-1.549964);
   fczpt43->SetParError(10,0.002999476);
   fczpt43->SetParLimits(10,0,0);
   fczpt43->SetParameter(11,137.3085);
   fczpt43->SetParError(11,0.6594254);
   fczpt43->SetParLimits(11,100,160);
   fczpt43->SetParameter(12,88.04897);
   fczpt43->SetParError(12,0.6316166);
   fczpt43->SetParLimits(12,0,0);
   fczpt43->SetParameter(13,-1.005584);
   fczpt43->SetParError(13,0.002862064);
   fczpt43->SetParLimits(13,0,0);
   fczpt43->SetParameter(14,181.1357);
   fczpt43->SetParError(14,1.688762);
   fczpt43->SetParLimits(14,160,250);
   fczpt43->SetParameter(15,73.2368);
   fczpt43->SetParError(15,2.409523);
   fczpt43->SetParLimits(15,0,0);
   fczpt43->SetParameter(16,0.2075436);
   fczpt43->SetParError(16,0.002845562);
   fczpt43->SetParLimits(16,0,0);
   fczpt43->SetParameter(17,217.5777);
   fczpt43->SetParError(17,7.201116);
   fczpt43->SetParLimits(17,200,500);
   fczpt43->SetParameter(18,-48.97675);
   fczpt43->SetParError(18,6.57194);
   fczpt43->SetParLimits(18,0,0);
   hzpt3krnlolo__3->GetListOfFunctions()->Add(fczpt43);
   hzpt3krnlolo__3->SetMarkerStyle(20);
   hzpt3krnlolo__3->GetXaxis()->SetTitle("gen. p_{T}(Z) (GeV)");
   hzpt3krnlolo__3->GetXaxis()->SetRange(2,33);
   hzpt3krnlolo__3->GetXaxis()->SetLabelFont(42);
   hzpt3krnlolo__3->GetXaxis()->SetTitleSize(0.05);
   hzpt3krnlolo__3->GetXaxis()->SetTitleOffset(1.25);
   hzpt3krnlolo__3->GetXaxis()->SetTitleFont(42);
   hzpt3krnlolo__3->GetYaxis()->SetTitle("NLO/LO ratio");
   hzpt3krnlolo__3->GetYaxis()->SetLabelFont(42);
   hzpt3krnlolo__3->GetYaxis()->SetTitleSize(0.05);
   hzpt3krnlolo__3->GetYaxis()->SetTitleOffset(1.25);
   hzpt3krnlolo__3->GetYaxis()->SetTitleFont(42);
   hzpt3krnlolo__3->GetZaxis()->SetLabelFont(42);
   hzpt3krnlolo__3->GetZaxis()->SetLabelSize(0.035);
   hzpt3krnlolo__3->GetZaxis()->SetTitleSize(0.035);
   hzpt3krnlolo__3->GetZaxis()->SetTitleFont(42);
   hzpt3krnlolo__3->Draw("");
   c1->Modified();
   c1->cd();
   c1->SetSelected(c1);
}
