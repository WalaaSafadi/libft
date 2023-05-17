/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstmap.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: wel-safa <wel-safa@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/17 20:03:00 by wel-safa          #+#    #+#             */
/*   Updated: 2023/05/17 22:47:09 by wel-safa         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

/*lst: The address of a pointer to a node.
f: The address of the function used to iterate on the list.
del: The address of the function used to delete the content
of a node if needed.
Iterates the list ’lst’ and applies the function
’f’ on the content of each node. Creates a new
list resulting of the successive applications of
the function ’f’. The ’del’ function is used to
delete the content of a node if needed.*/

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*newlst;
	t_list	*temp;

	if (!lst || !f)
		return (NULL);
	newlst = NULL;
	while (lst)
	{
		temp = ft_lstnew(f(lst->content));
		if (!temp)
		{
			ft_lstclear(&lst, del);
			ft_lstclear(&newlst, del);
			return (NULL);
		}
		ft_lstadd_back(&newlst, temp);
		lst = lst->next;
	}
	return (newlst);
}
