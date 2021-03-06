{

std::string indir="recoil_out2";

std::string  name1 =
"SingleEMU_Run2016BCD_PromptReco_met_para_study_ZSelecLowLPt_mu"
//"SingleEMU_Run2016BCD_PromptReco_smbin_met_para_study_ZSelecLowLPt_mu"
;
std::string  name2 =
//"SinglePhoton_Run2016BCD_PromptReco_HLT_DtScale_hlt_met_para_study_ZSelecLowLPt_mu"
//"SinglePhoton_Run2016BCD_PromptReco_HLT_DtScale_RcSmBin_smbin_hlt_met_para_study_ZSelecLowLPt_mu"
//"SinglePhoton_Run2016BCD_PromptReco_HLT_DtScale_RcSmBin_hlt_met_para_study_ZSelecLowLPt_mu"
//"SinglePhoton_Run2016BCD_PromptReco_HLT_DtScale_RcSmBin_hlt_id2_met_para_study_ZSelecLowLPt_mu"
//"SinglePhoton_Run2016BCD_PromptReco_HLT_DtScale_RcSmBin_hlt_id3_met_para_study_ZSelecLowLPt_mu"
//"SinglePhoton_Run2016BCD_PromptReco_HLTNo90_DtScale_hltno90_met_para_study_ZSelecLowLPt_mu"
//"SinglePhoton_Run2016BCD_PromptReco_HLTNo90_DtScale_hltno75_met_para_study_ZSelecLowLPt_mu"
//"SinglePhoton_Run2016BCD_PromptReco_HLTNo90_DtScale_hlt_phvto_met_para_study_ZSelecLowLPt_mu"
"SinglePhoton_Run2016BCD_PromptReco_HLT_DtScale_Flag2_hlt_flag2_met_para_study_ZSelecLowLPt_mu"
;

std::string name_file1 = indir+"/"+name1+".root";
std::string name_file2 = indir+"/"+name2+".root";

gROOT->ProcessLine(".x tdrstyle.C");
char name[1000];
std::string plots_file = indir+"/"+"plots_"+name1+"_VS_"+name2;

TCanvas* plots = new TCanvas("plots");


sprintf(name, "%s.pdf[", plots_file.c_str());
plots->Print(name);

TFile* _file_dt_sigma[10];
TFile* _file_mc_sigma[10];
TH1D* _h_dt_met_para_shift[10];
TH1D* _h_mc_met_para_shift[10];
TH1D* _h_met_para_shift_dtmc[10];
TH1D* _h_dt_met_para_sigma[10];
TH1D* _h_dt_met_perp_sigma[10];
TH1D* _h_mc_met_para_sigma[10];
TH1D* _h_mc_met_perp_sigma[10];
TH1D* _h_ratio_met_para_sigma_dtmc[10];
TH1D* _h_ratio_met_perp_sigma_dtmc[10];
TGraphErrors* _gr_dt_met_para_shift[10];
TGraphErrors* _gr_mc_met_para_shift[10];
TGraphErrors* _gr_met_para_shift_dtmc[10];
TGraphErrors* _gr_ratio_met_para_sigma_dtmc[10];
TGraphErrors* _gr_ratio_met_perp_sigma_dtmc[10];
TLegend* lg[1000];

    _file_dt_sigma[0] = new TFile(name_file1.c_str());
    _file_mc_sigma[0] = new TFile(name_file2.c_str());
    _h_dt_met_para_shift[0] = (TH1D*)_file_dt_sigma[0]->Get("h_met_para_vs_zpt_mean");
    _h_mc_met_para_shift[0] = (TH1D*)_file_mc_sigma[0]->Get("h_met_para_vs_zpt_mean");
    _h_met_para_shift_dtmc[0] = (TH1D*)_h_dt_met_para_shift[0]->Clone("h_met_para_shift_dtmc_all");
    _h_met_para_shift_dtmc[0]->Add(_h_mc_met_para_shift[0], -1);

    _h_dt_met_para_sigma[0] = (TH1D*)_file_dt_sigma[0]->Get("h_met_para_vs_zpt_sigma");
    _h_dt_met_perp_sigma[0] = (TH1D*)_file_dt_sigma[0]->Get("h_met_perp_vs_zpt_sigma");
    _h_mc_met_para_sigma[0] = (TH1D*)_file_mc_sigma[0]->Get("h_met_para_vs_zpt_sigma");
    _h_mc_met_perp_sigma[0] = (TH1D*)_file_mc_sigma[0]->Get("h_met_perp_vs_zpt_sigma");

    _h_ratio_met_para_sigma_dtmc[0] = (TH1D*)_h_dt_met_para_sigma[0]->Clone("h_ratio_met_para_sigma_dtmc_all");
    _h_ratio_met_perp_sigma_dtmc[0] = (TH1D*)_h_dt_met_perp_sigma[0]->Clone("h_ratio_met_perp_sigma_dtmc_all");
    _h_ratio_met_para_sigma_dtmc[0]->Divide(_h_mc_met_para_sigma[0]);
    _h_ratio_met_perp_sigma_dtmc[0]->Divide(_h_mc_met_perp_sigma[0]);

    // smooth functions
    _h_dt_met_para_shift[0]->SetName("h_dt_met_para_shift_all");
    _h_mc_met_para_shift[0]->SetName("h_mc_met_para_shift_all");
    _h_dt_met_para_shift[3] = (TH1D*)_h_dt_met_para_shift[0]->Clone("h_dt_met_para_shift_all_smooth");
    _h_mc_met_para_shift[3] = (TH1D*)_h_mc_met_para_shift[0]->Clone("h_mc_met_para_shift_all_smooth");
    _h_dt_met_para_shift[3]->Smooth();
    _h_mc_met_para_shift[3]->Smooth();

    _gr_dt_met_para_shift[3] = new TGraphErrors(_h_dt_met_para_shift[3]);
    _gr_mc_met_para_shift[3] = new TGraphErrors(_h_mc_met_para_shift[3]);

    _h_met_para_shift_dtmc[3] = (TH1D*)_h_met_para_shift_dtmc[0]->Clone("h_met_para_shift_dtmc_all_smooth");
    _h_met_para_shift_dtmc[3]->Smooth();

    _gr_met_para_shift_dtmc[3] = new TGraphErrors(_h_met_para_shift_dtmc[3]);

    _h_ratio_met_para_sigma_dtmc[3] = (TH1D*)_h_ratio_met_para_sigma_dtmc[0]->Clone("h_ratio_met_para_sigma_dtmc_all_smooth");
    _h_ratio_met_para_sigma_dtmc[3]->Smooth();

    _h_ratio_met_perp_sigma_dtmc[3] = (TH1D*)_h_ratio_met_perp_sigma_dtmc[0]->Clone("h_ratio_met_perp_sigma_dtmc_all_smooth");
    _h_ratio_met_perp_sigma_dtmc[3]->Smooth();

    _gr_ratio_met_para_sigma_dtmc[3] = new TGraphErrors(_h_ratio_met_para_sigma_dtmc[3]);
    _gr_ratio_met_perp_sigma_dtmc[3] = new TGraphErrors(_h_ratio_met_perp_sigma_dtmc[3]);


_h_ratio_met_para_sigma_dtmc[0]->GetYaxis()->SetTitle("Sigma Ratio");
_h_ratio_met_para_sigma_dtmc[0]->Draw();


  TH2D* h_dt_met_para_vs_zpt = (TH2D*)_file_dt_sigma[0]->Get("h_met_para_vs_zpt");
  TH2D* h_mc_met_para_vs_zpt = (TH2D*)_file_mc_sigma[0]->Get("h_met_para_vs_zpt");

  TH1D* h_dt_zpt = (TH1D*)h_dt_met_para_vs_zpt->ProjectionX("h_dt_zpt");
  TH1D* h_mc_zpt = (TH1D*)h_mc_met_para_vs_zpt->ProjectionX("h_mc_zpt");

  h_dt_zpt->Scale(1./h_dt_zpt->Integral("width"));
  h_mc_zpt->Scale(1./h_mc_zpt->Integral("width"));

  h_dt_zpt->SetLineColor(2);
  h_dt_zpt->SetMarkerColor(2);
  h_mc_zpt->SetLineColor(4);
  h_mc_zpt->SetMarkerColor(4);

  TH1D* h_zpt_dtmc = (TH1D*)h_dt_zpt->Clone("h_zpt_dtmc");
  h_zpt_dtmc->Divide(h_mc_zpt);

//  h_zpt_dtmc->Draw();


std::cout << "come here" << std::endl;

TH1D* h_met_para_vs_zpt_bin_dt[100];
TH1D* h_met_para_vs_zpt_bin_mc[100];

std::cout << "come here" << std::endl;
for (int i=0; i<h_dt_met_para_vs_zpt->GetNbinsX(); i++){
  sprintf(name, "h_met_para_vs_zpt_bin%d", i+1);
  h_met_para_vs_zpt_bin_dt[i] = (TH1D*)_file_dt_sigma[0]->Get(name);
  h_met_para_vs_zpt_bin_mc[i] = (TH1D*)_file_mc_sigma[0]->Get(name);

  lg[i] = new TLegend(0.6,0.7,0.9,0.9);
  sprintf(name, "h_met_para_vs_zpt_bin%d_dt", i+1);
  h_met_para_vs_zpt_bin_dt[i]->SetName(name);
  lg[i]->AddEntry(h_met_para_vs_zpt_bin_dt[i], name, "pl");
  sprintf(name, "h_met_para_vs_zpt_bin%d_mc", i+1);
  h_met_para_vs_zpt_bin_mc[i]->SetName(name);
  lg[i]->AddEntry(h_met_para_vs_zpt_bin_mc[i], name, "pl");

  h_met_para_vs_zpt_bin_dt[i]->Scale(1.0/h_met_para_vs_zpt_bin_dt[i]->Integral());
  h_met_para_vs_zpt_bin_mc[i]->Scale(1.0/h_met_para_vs_zpt_bin_mc[i]->Integral());

  h_met_para_vs_zpt_bin_dt[i]->SetLineColor(2);
  h_met_para_vs_zpt_bin_dt[i]->SetMarkerColor(2);
  
  h_met_para_vs_zpt_bin_mc[i]->SetLineColor(4);
  h_met_para_vs_zpt_bin_mc[i]->SetMarkerColor(4);

  plots->Clear();
  h_met_para_vs_zpt_bin_dt[i]->Draw("hist e");
  h_met_para_vs_zpt_bin_mc[i]->Draw("hist e same");
  lg[i]->Draw();
  plots->SetLogy(1);
  sprintf(name, "%s.pdf", plots_file.c_str());
  plots->Print(name); 
  plots->SetLogy(0);
  plots->Clear();

}

sprintf(name, "%s.pdf]", plots_file.c_str());
plots->Print(name);



}

