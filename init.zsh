# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::p6helm::deps()
#
#>
######################################################################
p6df::modules::p6helm::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: p6_helm_prompt_info()
#
#  Returns:
#	str - str
#
#  Environment:	 HELM_KUBECONTEXT HELM_NAMESPACE KUBECONFIG
#>
######################################################################
p6_helm_prompt_info() {

  local str

  if ! p6_string_blank "$KUBECONFIG"; then
    str="helm:\t\t  "
  fi

  local helm_ctx=${HELM_KUBECONTEXT:-$P6_KUBE_CFG}
  if ! p6_string_blank "$helm_ctx"; then
    str="${str}ctx:$helm_ctx"
  fi
  local helm_ns=${HELM_NAMESPACE:-$P6_KUBE_NS}
  if ! p6_string_blank "$helm_ns"; then
    str="${str} ns:$helm_ns"
  fi

  if p6_string_blank "$str"; then
    p6_return_void
  else
    p6_return_str "$str"
  fi
}
